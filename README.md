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

- has_many :items
- has_many :orders

## items テーブル 

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| preparation_day_id | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| prefecture_id	     | integer	  | null: false                    |
| item_condition_id  | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |

### Association

- belongs_to :users 
- has_one :orders

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


##  addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| prefecture_id	     | integer	  | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_numher       | string     | null: false                    |

### Association

- belongs_to :order
