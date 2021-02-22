# テーブル設計

## users テーブル

| Column     | Type     | Options                   |
| ---------- | -------- | ------------------------- |
| nickname   | string   | null: false               |
| email      | string   | null: false, unique: true |
| password   | string   | null: false               |
| name       | string   | null: false               |
| name_kana  | string   | null: false               |
| birthday   | datetime | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ------     | ------------------------------ |
| title      | string     | null: false                    |
| price      | integer    | null: false,                   |
| user       | references | null: false, foreign_key: true |
| catch_copy | text       | null: false                    |
| category   | string     | null: false                    |
| state      | string     | null: false                    |
| postage    | string     | null: false                    |
| address    | string     | null: false                    |
| time       | integer    | null: false                    |

### Association

- belongs_to :users
- has_one    :buys


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :buy_address

## buys_address テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| telephone   | references | null: false, foreign_key: true |
| postcode    | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| block       | string     | null: false                    |
| building    | string     |                                |
| card_number | integer    | null: false                    |
| card_month  | integer    | null: false                    |
| card_year   | integer    | null: false                    |
| card_cvc    | integer    | null: false                    |


### Association

- belongs_to :buys