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

6/5現在では「①インスタ自動投稿機能」を第一候補として考えています。

②と③は個人情報を扱う案件なので、セキュリティのリスクを考えてお蔵入りにする予定です。



## ①インスタ投稿を自動化したい
インスタ投稿自動化の開発案件です。

ショップ運営で大変なことの1つにインスタの定期的な投稿という作業があります。

まずBASEの出品商品の画像をダウンロードし、インスタ用に少し明るく加工します。

次に商品説明文をインスタ投稿のテンプレに貼り付けて投稿する、という流れを自動化したいとのことでした。

インスタ投稿をサボってしまうと、ショップの運営がちゃんとされているのかお客さんが不安になることがあります。

１日１５分ほどは短縮できる＆外注費も浮くので優先度は高めです。


## ②売上＆利益管理を自動化したい
ショップの売上管理の自動化案件です。

具体的にはBASEや仕入先のサイトから売上や仕入れ値の情報を取得してきて、それをスプレッドシートに入力する作業です。

売上の他に、購入者の氏名や日付などの情報も必要になり、毎日たくさん売れている人ほど大変な作業になってきます。

１日の作業自体は数分で終わりますが、心理的に面倒な作業なので放置されている方も多い作業になります。


現状各ショップオーナーは手動でこの作業をやっていて、厳密に利益計算ができている訳では無いとのことです。

とは言え秘匿性の高い情報なので外注することはできず、自分でやるしかありません。

３人ともこの機能があったら使いたいとのことで、開発優先度は高めになります。


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



# ◆使用技術

・バックエンド　Ruby

・フレームワーク　Rails

・フロントエンド　JavaScript

・インフラ　AWS

・データベース　MySQL

・API　→　BASE、チャットGPT、インスタグラムのAPIが必要になる


# ◆機能要件（インスタ機能のみ）

・BASEから画像と商品説明の情報を取得してアプリのDBに保存する
→調べたらBASEのAPIで両方とも取得可能でした

・BASE商品説明文から「商品PR文」だけを抽出する
→チャットGPTで実現できます。APIを導入して全商品を一括で編集する機能も作りたいです

・ついでにチャットGPTにインスタ用のPR文に編集してもらう

・その情報を元にインスタのAPIを使って自動投稿する
→調べたらAPI経由で投稿することができるようです。メタ社が公式で用意しているものなのでスパム行為さえしなければ規約違反ではないそうです。

・基本毎日投稿するので、一度投稿した商品を二度投稿しないように管理する必要がある。
→データベースで管理すれば同じ商品データを重複して登録できないようにできますね。

・画像をどうやってデータベースに保存するか調べる必要がある

・インスタ投稿済みの商品に「投稿済み」という印が付くようにする　
→利用者が分かりやすいようにデザインできればOK

・投稿したいものだけ選択して投稿ボタンをクリックすれば投稿できるようにする
→できれば一括でチェックを付けて選択できるようにもしたい


# ◆非機能要件（インスタ機能のみ）

・性能要件: ツールは大量の商品データを効率的に処理できる必要がある。BASEからのデータ取得、インスタへの投稿、データベースへの保存などの操作におけるレスポンス時間をストレスのないようにする。

・可用性要件: ツールは常に使用可能であるべき。エラーやバグでダウンする時間を限りなく少なくする。

・信頼性要件: ツールは正確な結果を提供する必要がある。具体的には、商品のデータ抽出、インスタへの投稿、二度投稿の防止などについての信頼性が求められる。

・セキュリティ要件: 今回のアプリではそこまでセキュアなものにする必要はない。

・保守性要件: メンテナンスやトラブルシューティングを容易にするために、分かりやすいドキュメンテーションが必要。清潔なコードで記述する。

・ユーザビリティ要件: ツールのユーザインターフェースは直感的で簡単に使えるように設計する。

・互換性要件: ツールは各種ブラウザやOSと互換性を持つように設計する。余裕があればレスポンシブ対応もする。

