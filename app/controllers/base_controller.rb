class BaseController < ApplicationController

  # 必要なRubyの標準ライブラリを読みこむ
  require 'net/http'
  require 'uri'
  require 'json'

  # BASE APIにアクセスするために必要な情報を定数として定義
  CLIENT_ID = '【クライアントID】'
  CLIENT_SECRET = '【クライアントシークレット】'
  REDIRECT_URL = '【リダイレクトURL】'

  # BASE APIから認可コードを取得し、それを使用してアクセストークンを取得するためのメソッド
  def authorize
    # URLのクエリパラメータから認可コードを取得
    code = params[:code]

    # 認可コードがない場合にBASEの認可ページにリダイレクト
    unless code
      auth_url = "https://api.thebase.in/1/oauth/authorize?response_type=code&client_id=#{CLIENT_ID}&redirect_uri=#{REDIRECT_URL}&scope=read_items"
      redirect_to auth_url and return
    end

    # 認可コードがある場合、これを使用してアクセストークンを取得
    uri = URI.parse('https://api.thebase.in/1/oauth/token')
    # Net::HTTPオブジェクトを新しく作成。このオブジェクトは、HTTPリクエストを送信するために使用する
    http = Net::HTTP.new(uri.host, uri.port)
    # SSLを使用する場合はtrueにする
    http.use_ssl = true
    # POSTリクエストを作成
    req = Net::HTTP::Post.new(uri.path)

    # POSTリクエストのボディに必要な情報をセット
    req.set_form_data({
      'client_id' => CLIENT_ID,
      'client_secret' => CLIENT_SECRET,
      'code' => code,
      'grant_type' => 'authorization_code',
      'redirect_uri' => REDIRECT_URL,
    })

    # リクエストを送信し、レスポンスを取得
    res = http.request(req)
    # 取得したレスポンス（JSON形式の文字列）をRubyのハッシュに変換
    response_array = JSON.parse(res.body)

    # エラーがある場合エラーメッセージを表示
    if response_array['error']
      render plain: response_array['error_description'] and return
    end

    # アクセストークンをセッションに保存
    session[:access_token] = response_array['access_token']
    # get_itemsアクションにリダイレクト
    redirect_to action: 'get_items'
  end

  # BASE APIから商品情報を取得するためのメソッド
  def get_items
    # アクセストークンを使用して、商品情報を取得
    uri = URI.parse('https://api.thebase.in/1/items?limit=100&offset=0')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri.path)
    # リクエストヘッダーにアクセストークンをセット
    req['Authorization'] = "Bearer #{session[:access_token]}"
    res = http.request(req)
    response_array = JSON.parse(res.body)

    if response_array['error']
      render plain: response_array['error_description'] and return
    end

    # 取得した商品情報（JSON形式の文字列）をitemdata.jsonというファイルに書き込む
    File.write('itemdata.json', res.body)
    # 成功メッセージを表示
    render plain: 'Success'
  end
end
