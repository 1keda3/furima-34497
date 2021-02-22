# テーブル設計

## users テーブル

| Column               | Type     | Options                   |
| -------------------- | -------- | ------------------------- |
| nickname             | string   | null: false               |
| email                | string   | null: false, unique: true |
| encrypted_password   | string   | null: false               |
| last_name            | string   | null: false               |
| first_name           | string   | null: false               |
| last_name_kana       | string   | null: false               |
| first_name_kana      | string   | null: false               |
| birthday             | date     | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ------     | ------------------------------ |
| title       | string     | null: false                    |
| price       | integer    | null: false,                   |
| user        | references | null: false, foreign_key: true |
| catch_copy  | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| postage_id  | integer    | null: false                    |
| address_id  | integer    | null: false                    |
| time_id     | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :buy


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buy_address

## buys_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| telephone     | string     | null: false                    |
| postcode      | string     | null: false                    |
| prefecture_id | references | null: false, foreign_key: true |
| city          | references | null: false, foreign_key: true |
| block         | references | null: false, foreign_key: true |
| building      | references | foreign_key: true              |

### Association

- belongs_to :buy