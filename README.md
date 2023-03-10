# テーブル設計

## users テーブル

| Column             | Type        | Options                              |
| ------------------ | ----------- | ------------------------------------ |
| nickname           | string      | null: false                          |
| password           | string      | null: false                          |
| email              | string      | null: false, uniqe: true, index: true|
| first_name         | string      | null: false                          |
| family_name        | string      | null: false                          |
| first_name kana    | string      | null: false                          |
| family_name_kana   | string      | null: false                          |
| birth_date         | date        | null: false                          |

### Association

- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy

## items テーブル 

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| item_condition     | integer    | null: false                    |
| postage_payer      | integer    | null: false                    |
| preparation_day    | integer    | null: false                    |
| postage_type       | integer    | null: false                    |
| category           | integer    | null: false                    |
| trading_status     | integer    | null: faise                    |
| seller             | references | null: false                    |
| buyer              | references | null: false                    |
| name               | string     | null: false                    |
| item_condition     | integer    | null: false                    |


### Association

- has_many :comments
- belongs_to :user

## product テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| price         | string     | null: false                    |
| description   | string     | null: false                    |
| status        | string     | null: false                    |
| size          | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| shipping_days | string     | null: false                    |
| prefecture_id | string     | null: false                    |
| judgment      | string     |                                |
| category_id   | integer    | null: false, foreign_key: true |
| brand_id      | integer    | null: false, foreign_key: true |
| shipping_id   | integer    | null: false, foreign_key: true |
| user_id       | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy

##  destination テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| customer_ id       | string     | null: false                    | 
| card_id            | string     | null: false                    |
| post code          | string     | null: faise                    |
| city               | string     | null: false                    |
| house_number       | string     | null:false                     |
| building_name      | string     |                                |
| phone_numher       | string     | unique: true                   |

### Association
- belongs_to :user

