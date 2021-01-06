# テーブル設計

## users テーブル

| Column         | Type      | Options       |
| -------------  | --------- | ------------- |
| name           | string    | null: false   |
| email          | string    | null: false   |
| password       | string    | null: false   |
| password_confirmation | string | null: false |
| full_name      | string    | null: false   |
| full_name_kana | string    | null: false   |
| birthday       | date      | null: false   |

### Association

- has_many :items
- has_many :buyers

## items テーブル

|  Column   | TYPE      | Options        |
| --------- | --------- | -------------- |
| image     | string    | null: false    |
| product | string | nill: false |
| product_explain | text | null: false |
| category | string | null: false |
| condition | string | null: false |
| burden | string | null: false |
| area | string | null: false |
| delivery_time | string | null: false |
| price | integer | null: false |
| user_id | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyers

## buyers テーブル

|  Column   | TYPE      | Options        |
| --------- | --------- | -------------- |
| user_id   | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## address テーブル

|  Column   | TYPE      | Options        |
| --------- | --------- | -------------- |
| postcode | integer | null: false |
| prefectures | string | null: false |
| city | string | null: false |
| block | string | null: false |
| building | string | null: false |
| phone_number | integer | null: false |

### Association

belongs_to :buyer