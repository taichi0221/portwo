# アプリケーション概要
プロフィール入力機能
ユーザーが自分自身の情報を入力することができます。名前、趣味、前職、使えるフレームワークや言語など、自分自身に関する情報を入力していただきます。

ポートフォリオアドバイス機能
ユーザーが入力した情報をもとに、ポートフォリオのアドバイスを表示します。具体的には、自分に合ったポートフォリオの作り方や、どのようなプロジェクトを作れば良いかなどをアドバイスします。

ポートヘルパーは、エンジニアを目指す方にとって、自分に合ったポートフォリオ作りのサポートを提供することを目的としています。

# URL
https://port-helper.onrender.com/

# テスト用アカウント
hoge@hoge
user11

# 利用方法

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1J09HsYv7tMp43BW9BSOZNGPDQYHzzfYuqF1Ogveqq_A/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/0cca3aa9e7e05e90e5600546884ad6ba.png)](https://gyazo.com/0cca3aa9e7e05e90e5600546884ad6ba)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/b5d7987450f800df9b0a0f70d11e00f0.png)](https://gyazo.com/b5d7987450f800df9b0a0f70d11e00f0)
# ローカルでの動作方法

# 工夫したポイント

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