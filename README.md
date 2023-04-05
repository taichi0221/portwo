# テーブル設計

## users テーブル

| Column             | Type     |Options                    |
| ------------------ | -------- | -----------               |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |


### Association

- has_one :profile

## profiles テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| language          | string     | null: false                    |
| framework         | text       | null: false                    |
| hobby             | string     | null: false                    |
| former_job        | string     |                                |
| desired_engineer  | integer    | null: false                    |
| user              | integer    | null: false ,foreign_key: true |

### Association

- belongs_to :user
