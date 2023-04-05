# テーブル設計

## users テーブル

| Column             | Type     |Options                    |
| ------------------ | -------- | -----------               |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birth_day          | date     | null: false               |


### Association

- has_many :items
- has_many :buys

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| situation_id      | integer    | null: false                    |
| price             | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| shipping_day_id   | integer    | null: false                    |
| delivery_charge_id| integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy
- belongs_to :category
- belongs_to :situation
- belongs_to :prefecture
- belongs_to :shipping_day
- belongs_to :delivery_charge

## buys テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address



## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false,                   |
| municipality  | string     | null: false,                   |
| address       | string     | null: false,                   | 
| building      | string     |                                |
| tel_number    | string     | null: false,                   |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
- belongs_to :prefecture_id