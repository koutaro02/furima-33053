# テーブル設計

## users テーブル

| Column         | Type      | Options       |
| -------------  | --------- | ------------- |
| name           | string    | null: false   |
| email          | string    | null: false   |
| encrypted_password | string | null:false   |
| first_name | string    | null: false   |
| last_name | string    | null: false   |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| birthday       | date      | null: false   |

### Association

- has_many :items
- has_many :buyers

## items テーブル

|  Column   | TYPE      | Options        |
| --------- | --------- | -------------- |
| product | string | nill: false |
| product_explain | text | null: false |
| category_id | integer | null: false |
| prefecture_id | integer | null: false |
| burden_id | integer | null: false |
| area_id | integer | null: false |
| delivery_time_id | integer | null: false |
| price | integer | null: false |
| user | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

|  Column   | TYPE      | Options        |
| --------- | --------- | -------------- |
| user   | references | foreign_key: true |
| item | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

|  Column   | TYPE      | Options        |
| --------- | --------- | -------------- |
| postcode | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| block | string | null: false |
| building | string | |
| phone_number | string | null: false |
| buyer | references | foreign_key: true |

### Association

belongs_to :buyer