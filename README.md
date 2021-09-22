# アプリ名
**ICokka(いこっか)**
![1](https://user-images.githubusercontent.com/82088738/133511146-c616641a-080e-40b9-9d99-b7ed088cb950.png)

# 概要

**田園都市線沿線の公園情報**を投稿し、それに対してコメントを投稿できる**情報交換サイト**。

 **地元に密着した情報**を提供することで、近場で子供と遊べる場所を探している人に利用してもらいたい。

# 本番環境

*準備中*

ログイン情報（テスト用）

ニックネーム：テスト

パスワード:test1234

メールアドレス：test@test.com


# 制作背景（意図）

いつも同じ公園だと大人も子供もつまらない。かと言って遠出はしたく無い。

そんな時にちょっとだけ遠出したくらいの公園に行きたいけど、

>行った時に大きな子供がボール遊びしてて思うように遊べなかった

>天気が悪くても遊べる場所がこの公園にはある！

>この公園にはこの道具を持って行った方が良い！

などの実際に行ってみないとわからないちょっとした情報があればいいな、という不満を感じたことがある。


公園で立ち話をしているとそんな話題になることが多いことから、

*掲示板的な情報交換サイト*を作ればニーズがあると感じた。

**自分が長く住んでいる**田園都市線のエリアは子育て世帯に人気があり、地方から来ている人も多いめ、そう言った情報があれば安心できると思い、**自分の強みを生かせる部分**でもあると感じた。

# DEMO

*準備中*

# 工夫したポイント

- **シンプル**にまとめることで、見やすさと使い易さを向上させた。

- **GooglemapAPI**で公園の位置関係を示すことで、自分の住所から近い場所が視覚的にわかるようにした。

# 使用技術（開発環境）
<dl>
<dt> バックエンド</dt>
<dd>Ruby on rails<dd>
<dt>フロントエンド</dt>
<dd>JQuery,Ajax,Scss</dd>
<dt>データベース</dt>
<dd>Mysql</dd>
<dt>インフラ</dt>
<dd>Docker,Heroku</dd>
<dt>WEBサーバー</dt>
<dd>nginx</dd>
<dt>アプリケーションサーバー</dt>
<dd>Unicorn</dd>
<dt>ソース管理</dt>
<dd>Github, GithubDesktop</dd>
<dt>テスト</dt>
<dd>RSpec</dd>
</dl>

# 今後の課題
- 天気APIを使って天気を表示させる予定。
  - 天気を確認してから公園の情報を確認する作業を無くすことが本来やりたかったことではある。現在実装に向けて準備中。 
- 可読性を上げるためにserviceであったり、helperをもっと活用する。
  - サイトに記載されているコードの模写している部分は非常に可読性が低い。よって、自分でコードを整理しながら理解度を上げる。
- CircleCIを使ってメンテナンス性を上げる。
  - 開発環境の効率化を図ることで生産性を上げたい。現在勉強中。
- Reactを使って投稿されたメッセージなどにイイねを付けられるようにする。
  - 見た目にも楽しい要素を入れた方がユーザーには使いやすくなると考えている。


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| comment            | string | null: false               |


### Association

- has_many :message


## maps テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| image            | text       | null: false                    |
| comment          | text       | null: false                    |
| address          | integer    | null: false                    |
| longitude        | integer    | null: false, Active_hash       |
| latitude         | integer    | null: false, Active_hash       |


### Association

- has_one    :message

## messages テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, Active_hash       |
| map             | references | null: false, Active_hash       |

### Association

- belongs_to :user
- belongs_to :map



