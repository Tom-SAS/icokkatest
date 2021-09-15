###アプリ名
ICokka

###概要

 田園都市線沿線の公園情報を投稿し、それに対してコメントを投稿できる情報交換サイト。
 地元に密着した情報を提供することで、近場で子供と遊べる場所を探している人に利用してもらいたい。

###本番環境

これから用意します。

ログイン情報（テスト用）
ニックネーム：テスト
パスワード:test1234
メールアドレス：test@test.com

###制作背景（意図）

いつも同じ公園だと大人も子供もつまらない。かと言って遠出はしたく無い。
そんな時にちょっと遠出したくらいの公園に行きたいけど、情報が詳しい情報が無いから
行った時に大きな子供がボール遊びしてて思うように遊べなかったり、天気が悪いと遊べる場所がない、
などのちょっとした情報があればいいな、という不満を感じたことがある。
同じような人たちはそんなに多くはないかもしれないけれど、公園で立ち話をしているとそんな話題になることが多いことから、ニーズがあると感じた。

###DEMO

準備中

###工夫したポイント

・シンプルにまとめることで、見やすさと使い易さを向上させた。
・GooglemapAPIで公園の位置関係を示すことで、自分の住所から近い場所が視覚的にわかるようにした。

###使用技術（開発環境）
#バックエンド
Ruby on rails
#フロントエンド
JQuery,Ajax,Scss
#データベース
Mysql
#インフラ
Docker,Heroku
#WEBサーバー
nginx
#アプリケーションサーバー
Unicorn
#ソース管理
Github, GithubDesktop
#テスト
RSpec

###今後の課題
/天気APIを使って天気を表示させる予定。
/可読性を上げるためにserviceであったり、helperをもっと活用する。
/CircleCIを使ってメンテナンス性を上げる。
/Reactを使って投稿されたメッセージなどにイイねを付けられるようにする。


### テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| comment            | string | null: false               |


## Association

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


## Association

- has_one    :message

## messages テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, Active_hash       |
| map             | references | null: false, Active_hash       |

## Association

- belongs_to :user
- belongs_to :map



