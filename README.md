# ◆ネットショップ運営業務自動化アプリ

## 1,誰のどんな課題を解決するのか？

BASEでネットショップを運営しているショップオーナーの課題を解決します。

日々の業務で定型業務を始めとした作業の効率化や自動化が求められています。

特に、大きく稼いでいるショップオーナーたちは販売数も多くなるので
日常の面倒な作業を自動化することで得られる恩恵が大きいです。

今回は３人のショップオーナーにクライアントとして参加して頂くことになりました。

その内２人は本業レベルで稼がれているオーナーになります。

## 2,なぜそれを解決したいのか？

今回ヒアリングしたネットショップオーナーは定型業務の多さや時間の制約により、新たなリサーチなどの「より重要で本質的な仕事」に回す時間が限られていることに悩んでいます。

これは、成長のチャンスを逸してしまう可能性があり、また、ネットショップ運営におけるストレスや作業負荷の増加にもつながります。

これらの課題を解決することで、ネットショップオーナーの業務効率を向上させ、ビジネスのさらなる成長を支えます。


## 3,どうやって解決するのか？

エンジニアのペアでチームでWebアプリケーションを開発することで
作業効率化＆自動化の問題解決に取り組みます。

具体的な要件はネットショップオーナーのヒアリングを通じて定義しました。



# ◆具体的な要望

3人のショップオーナーにヒアリングをし、具体的に困っていることを教えてもらいました。

複数あるのでこれから絞っていく予定です。


## ①売上＆利益管理を自動化したい
ショップの売上管理の自動化案件です。

具体的にはBASEや仕入先のサイトから売上や仕入れ値の情報を取得してきて、それをスプレッドシートに入力する作業です。

売上の他に、購入者の氏名や日付などの情報も必要になり、毎日たくさん売れている人ほど大変な作業になってきます。

１日の作業自体は数分で終わりますが、心理的に面倒な作業なので放置されている方も多い作業になります。


現状各ショップオーナーは手動でこの作業をやっていて、厳密に利益計算ができている訳では無いとのことです。

とは言え秘匿性の高い情報なので外注することはできず、自分でやるしかありません。

３人ともこの機能があったら使いたいとのことで、開発優先度は高めになります。


## ②AIがショップのお客様の質問に回答する機能を作って欲しい
顧客対応自動化AIの開発案件です。

あるオーナーの話によると、ショップ運営で一番時間がかかるところが問い合わせ対応とのことでした。

現状はショップの公式ラインで問い合わせ対応の一部自動化をしているが、事前に用意したテンプレートと完全一致した問い合わせでなければ回答をしてくれないという問題があるようです。

そもそも公式ラインに登録しない人もいるので、ショップのページからブラウザでアクセスできるところにQ&Aアプリを作りたいとのことでした。

具体的にはショップのアバウトページやよくある質問のリストをチャットGPTに参照させて回答してもらうものを作れば良いと思います。

最も時間がかかる部分の自動化になるので開発優先度は高いです。


## ③発注業務を自動化したい
発注自動化の開発案件です。

商品の仕入元の倉庫から発送された時に、BASEで該当の商品（複数ある）の発送通知ボタンを一括で押す機能になります。


この機能は２つに分かれます。

#### ①売れた商品が仕入元から発注された時にメールで（ショップオーナーに）通知する機能

1日1回、その日に発送された商品の情報をまとめてメールで通知してほしいそうです。

どの商品が発注されたのかを毎回スプレッドシートを見て確認するのが手間だからです。

ショップの外注スタッフさんが作業を担当されることもあるので、その切り分けなども課題です。

ただしこちらの優先度は高くないとのことでした。


#### ②商品の仕入元の倉庫から発送された時に、BASEで該当の商品の発送通知ボタンを押す機能

メインで開発したいものはこちらです。

全自動ではなく、ショップオーナーが一度確認をしてOKなら、一括で発送通知ボタンを押すようなプログラムを作りたいという話でした。

仕入元から発注されて追跡番号が記載された商品の、購入者の名前を取得し、
そこからBASEに飛んで、追跡番号を添えたメッセージ送信と発送通知をする感じになります。

これを１日分の売れた商品全てに対して行うイメージです。


※以下アドバンスな要望として頂いたものです

中国から仕入れる時の代行業者が複数社存在していて、ショップオーナーによって使用している業者が変わります。

そのどれかに対応したものよりも、全ての業者に対応した発注自動化のシステムを作れたら最高という要望も頂きました。

データを抽象化して共通化できるところは共通化すれば実現可能ではないか？とのお話です。

正直なところ難易度はかなり高そうに思いました。



## ④インスタ投稿を自動化したい
インスタ投稿自動化の開発案件です。

ショップ運営で大変なことの1つにインスタの定期的な投稿という作業があります。

まずBASEの出品商品の画像をダウンロードし、インスタ用に少し明るく加工します。

次に商品説明文をインスタ投稿のテンプレに貼り付けて投稿する、という流れを自動化したいとのことでした。

インスタ投稿をサボってしまうと、ショップの運営がちゃんとされているのかお客さんが不安になることがあります。

１日１５分ほどは短縮できる＆外注費も浮くので優先度は高めです。



# ◆実現する上で壁になりそうなところ
## ①利益管理ツール

売上や仕入れ値のデータは実際に商品を販売して仕入れをしないと取得できないので（サイトに表示されないので）、
エンジニア側でテスト環境を準備することが難しそうです。
自費で購入するのも一つの手ではあります。

1つの商品で販売サイトと仕入れサイトの情報を連携させるところです。仕入元が中国で、商品の名前（表記）が違っているという問題もあります。

BASEのAPIを使えるように追加で学習する必要があります。


## ②AI顧客対応アプリ（ツール）

BASEはカスタマイズ性が低いので、ショップの内部にこの機能を埋め込むことができないです。
外部のアプリを作ってそこにアクセスしてもらうしかないです。

チャットGPTのAPIを使えることがマストになります。

チャットGPTに学習させられる文字数の制限がボトルネックになりそうです。

## ③発注業務の自動化ツール
売上データ入力と同じ壁なのですが、開発者側でBASEでの販売をしないとデータを入手できないので、そこを用意することが必要になります。

それと、スプレッドシートやBASEでの更新された情報だけを取得するやり方が分からないので調べる必要があります。

基本的に毎日使うものなので、差分だけを取得できないといけません。

## ④インスタ投稿自動化ツール

インスタの規約上、自動投稿はNGです。
最悪のケースだとショップオーナーのアカウントが凍結されます。

なので、投稿自体の自動化はせずに、投稿内容の生成と自動入力までを行ってくれる機能を作りたいなと考え中です。

投稿文の生成はBASEの商品説明文からチャットGPTに良い感じのものを生成してもらおうかと思います。

クリエイタースタジオというツールを使用することで予約投稿ができるので、そこに自動でアップロードする形で実現できないかと思っています。


それからBASEの説明文の一部を切り抜くところをどうやって実現しようか考え中です。

説明文の中には発送日数や注意事項なども含まれるので、必要な情報だけを抽出する方法を調べる必要があります。

これもチャットGPTに投げれば簡単にできそうな気がしています。



# ◆使用技術

・バックエンド　Ruby

・フレームワーク　Rails

・フロントエンド　JavaScript

・インフラ　AWS

・データベース　MySQL　※必要に応じて

# ◆技術的な悩み
・調べないと分かりませんが、発送通知や利益管理などはGASやVBAなどを使えば実現できそうなところです。
ノーコードのRPAツールなどでも実現できてしまいそうな気がしています。

就活をする時に「なぜわざわざRubyを使って独自のアプリを開発する必要があるのか」という問いに答えられるか微妙なところです・・・

なのでこれらは要望の優先度としては高いものの、技術的には優先度が低くなりそうです。

・DB設計が必要になりそうな案件がなかったことも悩んでいます。

→ヒアリングでは出てこなかったですが、「公式ラインの過去のやりとりを検索できるデータベース」の開発を逆オファーしようか考え中です。

ただ、この開発をする場合はセキュリティの学習を追加でやる必要がありそうです。


# ◆ペアプロでの悩み
・設計をどちらが担当するのかで悩んでいます。

例えばフロントエンドとバックエンドとインフラの設計を分業しても問題ないのか？などです。

・他に注意点がありましたら教えて頂きたいです。

