# アプリ名/ICokka(いこっか)

![09e02fc8cfd1e52c42d7f9321d545466](https://user-images.githubusercontent.com/82088738/135751356-cf390329-32a4-47d9-8a93-abf4377ca8cb.gif)

# 概要

**横浜市青葉区・都筑区の公園情報**を投稿し、それに対してコメントを投稿できる**情報交換サイト**。

 **地元に密着した情報**を提供することで、近場で子供と遊べる場所を探している人に利用してもらいたい。

# 本番環境

https://icokkatest.herokuapp.com/　

ログインID

email: test@gmail.com

password: testtest1

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

公園情報を投稿する
[![Image from Gyazo](https://i.gyazo.com/09ae7b02fda4b2167fd01f411c414999.gif)](https://gyazo.com/09ae7b02fda4b2167fd01f411c414999)

公園の詳細情報を閲覧する
[![Image from Gyazo](https://i.gyazo.com/a85886f47c5c671fd1c41926ca4fb83f.gif)](https://gyazo.com/a85886f47c5c671fd1c41926ca4fb83f)

公園情報にコメントする
[![Image from Gyazo](https://i.gyazo.com/2abbdd9047dd850698277971612e4f4e.gif)](https://gyazo.com/2abbdd9047dd850698277971612e4f4e)



# 工夫したポイント

- **週間天気予報**を表示させることで別サイトで確認する手間を省くことができるようにした。

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
<dd>Heroku(準備中)</dd>
<dt>WEBサーバー</dt>
<dd>nginx</dd>
<dt>アプリケーションサーバー</dt>
<dd>Puma</dd>
<dt>ソース管理</dt>
<dd>Github, GithubDesktop</dd>
<dt>テスト</dt>
<dd>RSpec</dd>
</dl>

# 今後の課題
- 見た目をユーザーフレンドリーにする
  - scssなど見た目の調整がまだまだ必要。勉強中です。 
- コードの可読性を上げるためにserviceであったり、helperをもっと活用する。
  - サイトに記載されているコードの模写している部分は非常に可読性が低い。よって、自分でコードを整理しながら理解度を上げる。
- CI/CDを使ってメンテナンス性を上げる。
  - 開発環境の効率化を図ることで生産性を上げたい。現在勉強中。
- Reactを使って投稿されたメッセージなどにイイねを付けられるようにする。
  - 見た目にも楽しい要素を入れた方がユーザーには使いやすくなると考えている。
- 地図上に公園を表示するアイコンを変更する。
  - アイコンを変えることで公園がどこにあるのか、パッと見でわかるようにする。

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



