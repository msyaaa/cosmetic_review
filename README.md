# README

# アプリケーション名
- ### Cosmetic Review
![トップページ画像](https://i.gyazo.com/dcfb9b4c48c7b230f00dd8ec5d58b47c.png)

Cosmetic Reviewは男性用化粧品クチコミアプリケーションです。

# アプリケーション概要
ユーザーは化粧品のクチコミを商品画像、商品名、クチコミ文、カテゴリー、評価、購入店、購入価格を記入し投稿することができます。<br>
また投稿一覧表示やカテゴリー検索、お気に入りした投稿を確認することができます。

# 本番環境(デプロイ先　テストアカウント＆ID)
### URL
https://cosmetic-review.herokuapp.com/

### テスト用アカウント
ゲストログインボタンがございますので、そちらからお願いします。

### 利用方法
- 投稿方法<br>
テストアカウントでログイン→ヘッダーから「投稿する」ボタン押下→商品レビュー入力→「投稿する」
- 確認後、ログアウト処理をお願いします。

### 注意事項
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。<br>
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。

# 目指した課題解決、制作背景（意図）
#### 課題
私は化粧品を買う時にどれを選んだら良いのかを悩み、すごい時間がかかることがありました。また男性が化粧品を用いるのは増加傾向にあるが、友人も私と同じようにどの商品を選んだら良いのかが判断しづらいと感じていることがわかりました。

#### 解決策
男性化粧品を使ったことのある人がその商品に対しての感想を投稿でき、それらがまとまったサイトがあると良いと考えました。
<br>
<br>
男性がいろんな種類の化粧品がまとまったクチコミサイトを見て、商品を選ぶ時間の短縮やより詳細な情報をもとに商品を選ぶことができるサービスを作ってみようと思いました。

# 洗い出した要件
|     機能     |            目的           |              詳細              |         ストーリー(ユースケース)         |
| ----------- | ------------------------- | ----------------------------- | ---------------------------------- |
| クチコミ投稿機能 | 商品に対しての自分の評価を投稿できるようにするため | 商品画像、商品名、レビュー文、カテゴリー、5段階評価、購入店、購入価格を入力することでクチコミ投稿ができる | ・商品画像、商品名、レビュー文、カテゴリー、5段階評価、購入店、購入価格を入力することでクチコミ投稿ができるようにする    |
| クチコミ削除機能 | 投稿したクチコミ情報を削除できるようにするため | 自分が投稿したクチコミを削除することができる | ・クチコミが投稿されていることが前提<br>・自分が投稿したクチコミだけ削除可能<br>・削除をする前に一度確認アラートを表示 |
|  クチコミ編集機能   | 投稿したクチコミ情報を修正できるようにするため| 自分が投稿したクチコミを編集することができる	| ・クチコミが投稿されていることが前提<br>・登録したクチコミ情報は入力されている状態で表示される|
| プロフィール表示機能 | ユーザー登録情報を確認できるようにするため | プロフィール画像、ニックネーム、年齢、性別、自己紹介の確認をすることができる|・ユーザー登録されていることが前提<br>・プロフィール画像、自己紹介、年齢、性別、自己紹介文が表示される |
| ユーザー登録機能 | アプリケーションの利用、プロフィール機能を可能にするため| ニックネーム、メールアドレス、パスワード、生年月日、性別を必須としてユーザーを登録|・ニックネーム、メールアドレス、パスワード、生年月日、性別を必須としてユーザー登録できるようにする<br>・ユーザー登録をしていないとその他機能は使用できない |
| プロフィール編集機能 | 設定したユーザー情報を修正できるようにするため | プロフィール画像や自己紹介文などの編集をすることができる| ・ユーザー登録されていることが前提<br>・登録したユーザー情報は入力されている状態で表示される|
| エラーメッセージの日本語化 | どのようなエラーが出ているのかをわかりやすくするため | 入力したフォーム内容に情報が足りていないときにエラー文を日本語で表示する | ・フォーム入力に失敗した時にエラーメッセージを日本語で表示する |
| お気に入り機能 | 気になったクチコミを保存できるようにするため | 自分以外の気になったクチコミをお気に入り登録することができる | ・クチコミが投稿されていることが前提<br>・1つのクチコミに対して1回お気に入り登録することができる<br>・お気に入り登録するとカウントされる|
| 投稿一覧表示機能 | 投稿されたクチコミを確認できるようにするため | 今までのクチコミ投稿を一覧表示する | ・クチコミが投稿されていることが前提<br>・投稿日時が新しい順に表示される |
| カテゴリー検索機能 | 目的の商品のクチコミを探しやすくするため| 気になる商品のカテゴリーを絞ることでクチコミ一覧を見やすくする| ・クチコミが投稿されていることが前提<br>・カテゴリー検索を多階層で表示する<br>・条件に該当するクチコミ商品の検索結果のページで表示する|
| ユーザーの投稿・お気に入り一覧表示機能 | 過去のクチコミ投稿、お気に入り登録したクチコミを確認できるようにするため | マイページからそのユーザーのクチコミ投稿一覧とお気に入り登録一覧を表示する | ・クチコミが投稿していることが前提<br>・お気に入り登録していることが前提<br>・クチコミ投稿、お気に入り登録をした日時が新しい順に表示する |
| 関連商品表示機能 | すぐに違う商品のクチコミを確認できるようにするため | クチコミ詳細画面の下部にその商品と同じカテゴリーの商品クチコミを表示する |・同じカテゴリーのクチコミが複数投稿されていることが前提<br>・観覧している商品と同じカテゴリーの商品のクチコミを一覧表示する|
| クチコミ詳細表示機能 | クチコミ内容などの確認をできるようにするため | 商品画像、商品名、レビュー文、カテゴリー、5段階評価、購入店、購入価格、お気に入り数、投稿者、投稿日時を表示する | ・クチコミが投稿されていることが前提<br>・商品画像、商品名、レビュー文、カテゴリー、5段階評価、購入店、購入価格、お気に入り数、投稿者、投稿日時を表示する|
| キーワード検索機能 | 商品名でクチコミ検索をできるようにするため| 検索バーに任意の文字を入力することでその文字と一致するクチコミ商品だけを表示することができる |・クチコミが投稿されていることが前提<br>・条件に該当するクチコミ商品の検索結果のページで表示する |

# 実装した機能についてのGIFと説明
### クチコミ投稿機能
「投稿する」をクリックすると、ユーザーは商品のクチコミ情報をフォームに入力することができます。
![クチコミ投稿機能](https://i.gyazo.com/ecbee23252a899295d7456f3e8809b22.gif)

### クチコミ削除機能
クチコミ詳細画面に遷移し、「削除」をクリックすると登録した内容を削除することができます。また、誤操作を防ぐために「削除」をクリックした際はダイアログが表示されます。
![クチコミ削除機能](https://i.gyazo.com/a70baa4ba684dfc9370674b343033bda.gif)

### クチコミ編集機能
クチコミ詳細画面に遷移し、「投稿の編集」をクリックすると登録した内容を編集することができます。また、登録したクチコミ情報は入力されている状態で表示されます。
![クチコミ編集機能](https://i.gyazo.com/cdefafcf70756ad8e884afa3953f33e3.gif)

### プロフィール表示機能
ヘッダーからニックネームをクリックすることでマイページ画面に遷移することができます。
![プロフィール表示機能](https://i.gyazo.com/dd7306cc34ba92677e8392f47dc08876.png)

### プロフィール編集機能
マイページ画面に遷移し、「プロフィール編集」をクリックすると登録した内容を編集することができます。また、登録したユーザー情報は入力されている状態で表示されます。
![プロフィール編集機能](https://i.gyazo.com/74c3a4d34346fc3f2900ff7242eb2025.gif)

### ユーザー登録機能
トップページから「新規登録」をクリックし、ユーザー情報を入力することでユーザー登録を行うことができます。また、ログインも同様に行うことができます。
![ユーザー登録機能](https://i.gyazo.com/6079856d42df375b994e1fba91bb36b0.gif)

### お気に入り機能
クチコミ詳細画面に遷移し「ハートマーク」をクリックすると、クチコミをお気に入り登録することができます。
![お気に入り機能](https://i.gyazo.com/97834e37158c23123ee2cc51c5201b57.gif)

### エラーメッセージの日本語化
ユーザー登録画面やクチコミ投稿ページにアクセスし適当な文字をフォームに入力すると、エラーメッセージを日本語で確認することができます。
![エラーメッセージの日本語化](https://i.gyazo.com/894264abe39810cdfbf982bcbbf17ce5.gif)

### 投稿一覧表示機能
投稿一覧ページに遷移すると、今までのクチコミ投稿が一覧表示されます。
![投稿一覧表示機能](https://i.gyazo.com/960504fbf8c79cece74dfaa889a2ea33.png)

### カテゴリー検索機能
「カテゴリーから探す」にカーソルをもっていくと、カテゴリーが多階層で表示されます。カテゴリー名をクリックすることで、条件に該当するクチコミ商品の検索結果のページで表示します。
![カテゴリー検索機能](https://i.gyazo.com/0e0e82b1abdde52c398b49187dbf1a12.gif)

### ユーザーの投稿・お気に入り一覧表示機能
マイページ画面の下部に、「投稿したクチコミ一覧」と「お気に入り」がクリックをすることで切り替えて表示されます。
![ユーザーの投稿・お気に入り一覧表示機能](https://i.gyazo.com/44c6211666eb7618c681f2dd85c0b8e8.gif)

### 関連商品表示機能
クチコミ詳細画面の下部に、その商品と同じカテゴリーの商品クチコミが表示されます。
![関連商品表示機能](https://i.gyazo.com/f436f31df5d24d560c98b9b5f9658998.png)

### クチコミ詳細表示機能
クチコミ一覧表示の中から気になるクチコミをクリックすることで、その商品のクチコミ内容などが表示されます。
![クチコミ詳細表示機能](https://i.gyazo.com/e909e446b3cd2f2e0458e1d612747c13.png)

### キーワード検索機能
検索バーに任意の文字を入力することで、その文字と一致するクチコミ商品だけが表示されます。条件に該当するクチコミ商品の検索結果のページで表示します。
![キーワード検索機能](https://i.gyazo.com/7510850ed59dd01afe5d06ac336fdc30.gif)

# 工夫したポイント
- トップページでどんなアプリケーションなのかをわかるようにしたこと
- マイページを設けることでクチコミ投稿者の特徴をわかるようにしたこと
- クチコミ検索を商品名とカテゴリーからできるようにしたこと
- 評価を星で表すことでわかりやすくしたこと
- クチコミ削除を間違えた時のために確認表示するようにしたこと

# 使用技術(開発環境：言語、ツール、OS、DB、サーバ)
Ruby/Ruby on Rails/JavaScript/JQuery/MySQL/Github/AWS/Visual Studio Code

# 課題や実装予定の機能
- 「評価が高い順」や「投稿が新しい順」など表示方法の選択ができるようにする
- レスポンシブ機能を加える
- デザインを整える

# テーブル設計
## ER図
![データベース設計ER図](https://i.gyazo.com/e53aad9e8b4340767adf2693409ea042.png)

## users テーブル
|     Column     |    Type    |   Options   |
| -------------- | ---------- | ----------- |
|     nickname   |   string   | null: false |
|     email   |   string   | null: false |
|     password   |   string   | null: false |
| password_confirmation | string | null: false |
| birthday | date | null: false |
| introduce | text |
| gender | integer | null: false |

### Association
- has_many :posts
- has_many :likes
- has_one_attached :image

## posts テーブル
|  Column  |    Type    |   Options   |
| -------- | ---------- | ----------- |
|   name  |   string  | null: false |
|   price  |   integer  | null: false |
| description |  text   | null: false |
| evaluation |  float   | null: false |
|   shop_name  |   string  |
|   category   |  references    | null: false, foreign_key: true |
|   user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- has_many :likes, dependent: :destroy
- has_one_attached :image

## likes テーブル
|  Column |  Type  |   Options   |
| ------- | ------ | ----------- |
|   post  | references | null: false, foreign_key: true | 
|   user  | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :post

## categories テーブル
|  Column |  Type  |   Options   |
| ------- | ------ | ----------- |
|   name  |  string  | null: false, index: true |
| ancestry | string | index: true | 

### Association
- has_many :posts
- has_ancestry

### requirement
- ruby '2.6.5'
- rails　'6.0.0'
- ancestry
- rails-i18n
- mini_magick
- image_processing', '~> 1.2'
- devise

# 著者
[Qiita](https://qiita.com/iwkmsy9618)

# license
This software is released under the MIT License, see LICENSE.txt.
