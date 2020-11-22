## users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false, unique: true	|
| password | string | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| text             | text       | null: false                    |
| price            | integer    | null: false                    |
| item_status_id   | references | null: false, foreign_key: true |
| delivery_fee_id  | references | null: false, foreign_key: true |
| address_id       | references | null: false, foreign_key: true |
| delivery_date_id | references | null: false, foreign_key: true |
| genre_id         | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record
- has_many :buyer_addresses
- has_many :comments
- has_one_attached :image

## purchase_records テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer_address

## buyer_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| address_id         | references | null: false, foreign_key: true |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| tell_number        | integer    | null: false                    |
| purchase_record_id | references | foreign_key: true              |
| item_id            | references | foreign_key: true              |

### Association
- has_many :items
- belongs_to :purchase_record