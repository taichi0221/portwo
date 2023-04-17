# アプリケーション概要
プロフィール入力機能<br>
ユーザーが自分自身の情報を入力することができます。名前、趣味、前職、使えるフレームワークや言語など、自分自身に関する情報を入力していただきます。

ポートフォリオアドバイス機能<br>
ユーザーが入力した情報をもとに、ポートフォリオのアドバイスを表示します。具体的には、自分に合ったポートフォリオの作り方や、どのようなプロジェクトを作れば良いかなどをアドバイスします。

ポートヘルパーは、エンジニアを目指す方にとって、自分に合ったポートフォリオ作りのサポートを提供することを目的としています。

# 使用技術
OpenAI APIを導入して自然言語処理に取り組んでいます。
最新の自然言語処理技術であるNLP分野を取り入れることで、ユーザーからの情報により正確に答えることを目指しています。

言語：JavaScript, Ruby<br>
フレームワーク：Ruby on Rails, bootstrap<br>
データベース：MySQL<br>
その他：Git, Docker, AWS, EC2<br>

# 実装した機能についての画像
[![Image from Gyazo](https://i.gyazo.com/308f1248900e64c872e568f1feace02e.png)](https://gyazo.com/308f1248900e64c872e568f1feace02e)
プロフィール入力画面<br><br>
[![Image from Gyazo](https://i.gyazo.com/f5b6c9b3efcaa148cbbd1eceae634ca2.png)](https://gyazo.com/f5b6c9b3efcaa148cbbd1eceae634ca2)
Port-Helperからの解答画面<br><br>
[![Image from Gyazo](https://i.gyazo.com/da47a35fe80b3545453b72d8d981bca3.png)](https://gyazo.com/da47a35fe80b3545453b72d8d981bca3)
Port-Helperの解答作成中画面<br><br>

# 工夫したポイント
ポートフォリオに関する質問を引き出すために、ユーザーからの入力情報を限定し、openaiのAPIに送るパラメーターの中身を考えました。<br>
解答作成までの待ち時間が発生する問題に直面し、Ajaxを利用した改善を試みましたが速度の向上には至りませんでした。そこでログを確認したところ、質問と解答のDBへの保存に時間差かあることに気づきました。解答作成に必要な時間がどうしてもかかってしまうため、この問題とは共存するしかないと考え、ユーザビリティを上げるために解答待ちの間に動画を視聴できる仕組みを導入しました。

# URL
http://54.253.108.220/

# テスト用アカウント
hoge@hoge<br>
user11<br>
ご自由にアカウントをお作りいただき、詳細をご確認ください。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1J09HsYv7tMp43BW9BSOZNGPDQYHzzfYuqF1Ogveqq_A/edit#gid=982722306

# 就職活動中に実装完了した機能
Dockerを使ったEC2へのデプロイ<br>
画面遷移速度向上及び作業効率化のため：4/16完了しております。<br>

# 実装予定の機能
セキュリティ向上のお知らせ<br>
このプロジェクトでは、セキュリティの向上を重要視しており、近日中にHTTPからHTTPSへの移行を予定しております。 移行が完了次第、READMEファイルにその旨を追記いたしますので、ご確認ください。<br>
<追記>：https通信に変更をするのに非常に苦労しております。4/20までには完成させようと考えています。
ポートフォリオ作成に必要なスキルに関する質問と解答機能<br>
解答結果の共有機能<br>
エンジニア志望者同士の交流機能<br>
ポートフォリオ作成に必要なスキルに関する質問と解答機能や、解答結果の共有機能を実装することで、ユーザーがよりスムーズにポートフォリオ作成に取り組むことができるようになります。また、エンジニア志望者同士の交流機能を導入することで、お互いのスキルアップにも繋がります。<br>


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/0cca3aa9e7e05e90e5600546884ad6ba.png)](https://gyazo.com/0cca3aa9e7e05e90e5600546884ad6ba)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/b5d7987450f800df9b0a0f70d11e00f0.png)](https://gyazo.com/b5d7987450f800df9b0a0f70d11e00f0)


# テーブル設計

## users テーブル

| Column             | Type     |Options                    |
| ------------------ | -------- | -----------               |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |


### Association

- has_many :questions
- has_many :answers

## questions テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| language          | string     | null: false                    |
| framework         | string     | null: false                    |
| hobby             | string     | null: false                    |
| former_job        | string     |                                |
| desired_engineer  | string     | null: false                    |
| user              | integer    | null: false ,foreign_key: true |

### Association

- belongs_to :user
- has_one :answer

## answers テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| question          | integer    | null: false ,foreign_key: true |
| user              | integer    | null: false ,foreign_key: true |
| answer            | text       | null: false                    |

### Association

- belongs_to :question
- belongs_to :user