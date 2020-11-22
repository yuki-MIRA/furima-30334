## users テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| family_name         | string     | null: false                    |
| first_name          | string     | null: false                    |
| family_name_reading | string     | null: false                    |
| first_name_reading  | string     | null: false                    |
| nickname            | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| birthday_id         | integer    | null: false                    |

### Association
- has_many :items
- has_many :comments
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| price            | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| address_id       | integer    | null: false                    |
| delivery_date_id | integer    | null: false                    |
| genre_id         | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record
- has_many :buyer_addresses
- has_many :comments
- has_one_attached :image

## purchase_records テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer_address

## buyer_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| address_id         | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     | null: false                    |
| tell_number        | string     | null: false                    |
| purchase_record    | references | foreign_key: true              |

### Association
- belongs_to :purchase_record