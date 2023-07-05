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

6/5現在では「インスタ自動投稿機能」を第一候補として考えています。

②と③は個人情報を扱う案件なので、セキュリティのリスクを考えてお蔵入りにする予定です。

※追記6/18　インスタ自動投稿ツールに決定しました。

## インスタ投稿を自動化したい
インスタ投稿自動化の開発案件です。

ショップ運営で大変なことの1つにインスタの定期的な投稿という作業があります。

まずBASEの出品商品の画像をダウンロードし、インスタ用に少し明るく加工します。

次に商品説明文をインスタ投稿のテンプレに貼り付けて投稿する、という流れを自動化したいとのことでした。

インスタ投稿をサボってしまうと、ショップの運営がちゃんとされているのかお客さんが不安になることがあります。

１日１５分ほどは短縮できる＆外注費も浮くので優先度は高めです。



# ◆使用技術

・バックエンド　Ruby

・フレームワーク　Rails

・フロントエンド　JavaScript

・インフラ　AWS

・データベース　MySQL

・API　→　BASE、チャットGPT、インスタグラムのAPIが必要になる


# ◆機能要件

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


# ◆非機能要件

・性能要件: ツールは大量の商品データを効率的に処理できる必要がある。BASEからのデータ取得、インスタへの投稿、データベースへの保存などの操作におけるレスポンス時間をストレスのないようにする。

・可用性要件: ツールは常に使用可能であるべき。エラーやバグでダウンする時間を限りなく少なくする。

・信頼性要件: ツールは正確な結果を提供する必要がある。具体的には、商品のデータ抽出、インスタへの投稿、二度投稿の防止などについての信頼性が求められる。

・セキュリティ要件: 今回のアプリではそこまでセキュアなものにする必要はない。

・保守性要件: メンテナンスやトラブルシューティングを容易にするために、分かりやすいドキュメンテーションが必要。清潔なコードで記述する。

・ユーザビリティ要件: ツールのユーザインターフェースは直感的で簡単に使えるように設計する。

・互換性要件: ツールは各種ブラウザやOSと互換性を持つように設計する。余裕があればレスポンシブ対応もする。


# ◆設計

![rapture_20230618233527](https://github.com/tomo178/original_product/assets/93224469/6cf6d9bc-f227-4a6a-8512-b4d2f2555c47)
![rapture_20230618233516](https://github.com/tomo178/original_product/assets/93224469/43c05fa9-8827-419d-a27e-e705c2de2b54)


## ワイヤーフレーム
![rapture_20230618233352](https://github.com/tomo178/original_product/assets/93224469/a9d42d01-08e0-40c6-9423-829d06d32d9d)
![rapture_20230618233440](https://github.com/tomo178/original_product/assets/93224469/d513b301-9c49-40ec-a7ed-38fe04d84e91)
![rapture_20230618233451](https://github.com/tomo178/original_product/assets/93224469/e9e65a41-b06d-4eb4-be91-c1bab06143e4)
ホーム画面の中にチャットGPTプロンプト入力窓を作る
![rapture_20230618233405](https://github.com/tomo178/original_product/assets/93224469/c0a8011d-16ba-4ff3-853c-0e508dc92e9c)
![rapture_20230618233417](https://github.com/tomo178/original_product/assets/93224469/105cbfc1-1faf-48ab-81ab-22b952f3b9a1)
![rapture_20230618233430](https://github.com/tomo178/original_product/assets/93224469/41f18f8d-b5e0-4170-858b-0410381a9644)


## テーブル定義書

#### Users Table

| Column           | Type    | Description                               |
|------------------|---------|-------------------------------------------|
| id               | integer | ユーザーの一意の識別子                     |
| loginID          | string  | ユーザーのID                               |
| password         | string  | ユーザーのパスワード（ハッシュ化された形で保存） |

#### Products Table

| Column           | Type    | Description                               |
|------------------|---------|-------------------------------------------|
| id               | integer | 商品の一意の識別子                        |
| name             | string  | 商品名                                    |
| description      | text    | 商品の説明文                              |
| image_url        | string  | 商品画像のURL                             |
| user_id          | integer | 商品を所有しているユーザーのID             |
| posted           | boolean | 商品が既にInstagramに投稿されたかどうか    |



## ER図
![IMG_20230705_130650](https://github.com/tomo178/original_product/assets/93224469/d517a087-c09c-4802-8c54-87a03703c6af)


## システム設計図
![rapture_20230704202236](https://github.com/tomo178/original_product/assets/93224469/518550dc-e331-4a24-9d47-82ee9b04fefa)
