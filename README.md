# テーブル設計

## users テーブル

| Column             | Type        | Options                       |
| ------------------ | ----------- | ----------------------------- |
| nickname           | string      | null: false                   |
| encrypted_pa​​ssword | string      | null: false                   |
| email              | string      | null: false, unique: true     |
| first_name         | string      | null: false                   |
| family_name        | string      | null: false                   |
| first_name kana    | string      | null: false                   |
| family_name_kana   | string      | null: false                   |
| birth_date         | date        | null: false                   |

### Association

- has_many :products dependent: :destroy

## items テーブル 

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | string     | null: false                    |
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
| name          | string     | null: false                    |
| size          | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| shipping_days | string     | null: false                    |
| prefecture_id | string     | null: false                    |
| category_id   | integer    | null: false, foreign_key: true |
| brand_id      | integer    | null: false, foreign_key: true |
| shipping_id   | integer    | null: false, foreign_key: true |
| user_id       | integer    | null: false, foreign_key: true |

### Association

- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy

##  addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| orders             | references | null: false, foreign_key: true |
| post_code          | string     | null: faise                    |
| city               | string     | null: false                    |
| house_number       | string     | null:false                     |
| building_name      | string     |                                |
| phone_numher       | string     | unique: true                   |

### Association

- belongs_to :order