class BaseController < ApplicationController

  # 必要なRubyの標準ライブラリを読みこむ
  require 'net/http'
  require 'uri'
  require 'json'

  # BASE APIにアクセスするために必要な情報を定数として定義
  CLIENT_ID = '042b622d925cec0b1039758d8550bb79'
  CLIENT_SECRET = '35d7a1194d9cfae7e76abcdcc7f50f28'
  REDIRECT_URL = 'https://instaautopost.com/base/authorize'


  #BASEへの認可をするコード
  def request_authorize
    auth_url = "https://api.thebase.in/1/oauth/authorize?response_type=code&client_id=#{CLIENT_ID}&redirect_uri=#{REDIRECT_URL}&scope=read_items"
    Rails.logger.info "Redirecting to: #{auth_url}"
    redirect_to auth_url, allow_other_host: true
  end

  # BASE APIから認可コードを取得し、それを使用してアクセストークンを取得するためのメソッド
  def authorize
    Rails.logger.info "Start authorize action"
    Rails.logger.info "All Parameters: #{params.inspect}"

    # URLのクエリパラメータから認可コードを取得
    code = params[:code]
    Rails.logger.info "認可コード: #{code}"

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

    Rails.logger.info "Sending request to: #{uri}"

    # リクエストを送信し、レスポンスを取得
    res = http.request(req)

    # APIからのレスポンス内容をログに出力
    Rails.logger.info "API Response (Authorize): #{res.body}"

    # 取得したレスポンス（JSON形式の文字列）をRubyのハッシュに変換
    response_array = JSON.parse(res.body)

    # エラーがある場合エラーメッセージを表示
    if response_array['error']
      flash[:error] = response_array['error_description']
      Rails.logger.error "Error: #{response_array['error_description']}"
      redirect_to root_path and return
    end

    # アクセストークンをセッションに保存
    session[:access_token] = response_array['access_token']

    # セッションに保存されているアクセストークンをログに出力
    Rails.logger.info "Access Token: #{session[:access_token]}"
    Rails.logger.info "Redirecting to get_items action"

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
    Rails.logger.info "アクセストークン: #{session[:access_token]}"
    res = http.request(req)

    # APIからのレスポンス内容をログに出力
    Rails.logger.info "API Response (Authorize): #{res.body}"

    response_array = JSON.parse(res.body)

    # エラーがある場合エラーメッセージを表示
    if response_array['error']
      flash[:error] = response_array['error_description']
      redirect_to root_path and return
    end

    # 取得した商品情報（JSON形式の文字列）をitemdata.jsonというファイルに書き込む
    File.write('itemdata.json', res.body)
    Rails.logger.info "File written successfully"

    # ホームページにリダイレクト（Turboのエラー回避のため）
    sleep 2
    redirect_to root_path
  end
end
