# テーブル設計

## users テーブル

| Column             | Type        | Options                       |
| ------------------ | ----------- | ----------------------------- |
| nickname           | string      | null: false                   |
| encrypted_pa​​ssword | string      | null: false                   |
| email              | string      | null: false, unique: true     |
| first_name         | string      | null: false                   |
| family_name        | string      | null: false                   |
| first_name_kana    | string      | null: false                   |
| family_name_kana   | string      | null: false                   |
| birth_date         | date        | null: false                   |

### Association

- has_many :products
- has_many :items
- has_many :orders
- has_many :addresses


## items テーブル 

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | string     | null: false                    |
| description        | text       | null: false                    |
| preparation_day_id | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| trading_status_id  | integer    | null: faise                    |
| postage_type_id    | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |
| user_id            | integer    | null: false, foreign_key: true |


### Association

- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id   | integer    | null: false, foreign_key: true |
| user_id       | integer    | null: false, foreign_key: true |

### Association

- belongs_to :brand
- has_many :images
- has_many :addresses


##  addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| orders             | references | null: false, foreign_key: true |
| post_code          | string     | null: faise                    |
| prefecture_id	     | integer	  | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null:false                     |
| building_name      | string     |                                |
| phone_numher       | string     |                                |

### Association

- belongs_to :order
