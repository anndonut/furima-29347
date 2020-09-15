# README

## users テーブル

| column             | Type   | Options     |
| -------------------| ------ | ----------- |
| nickname           | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birth_day        | date   | null: false |


### Association 
- has_many : items
- has_many :transactions




## transactions (取引管理) テーブル
| column           | Type       | Options          |
| ---------------- | ---------- | ---------------- |
| user_id          | references | foreign_key:true |
| item_id          | references | foreign_key:true |

### Association 
- belongs_to: user
- belongs_to: item
- has_one :sending_destination


## sending_destinations テーブル
 
| column              | Type        | Options              |
| ----------------    | ------      | ------------         |
| post_code           | string      | null: false          |
| prefecture_code_id  | integer     | null: false          |
| city                | string      | null: false          |
| house_number        | string      | null: false          |
| building_name       | string      |                      |
| phone_number        | string      | null: false          |
| transaction_id      | references  | foreign_key:true     |


### Association 
- belongs_to :transaction
- Gem：jp_prefectureを使用して都道府県コードを取得

## items テーブル

| column              | Type   | Options               |
| ----------------    | ------ | ------------          |
| name                | string  | null: false          |
| introduction        | text    | null: false          |
| category_id         | integer | null: false          |
| condition_id        | integer | null: false          |
| shipping_expense_id | integer | null: false          |
| ship_from_area_id   | integer | null: false          |
| processing_time_id  | integer | null: false          |
| selling_price       | integer | null: false          |
| user_id             | references |foreign_key:true   |

### Association 
- belongs_to :user, class_name: "User"
- has_one :transaction, class_name: "Transaction"


