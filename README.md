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




## transaction (取引管理) テーブル
| column           | Type       | Options          |
| ---------------- | ---------- | ---------------- |
| user_id          | references | foreign_key:true |
| item_id          | references | foreign_key:true |

### Association 
- belongs_to: user
- has_many: items
- belongs_to :sending_destination


## sending_destination テーブル
 
| column              | Type    | Options              |
| ----------------    | ------  | ------------         |
| post_code_id        | string  | null: false          |
| prefecture_code _id | integer | null: false          |
| city                | string  | null: false          |
| house_number        | string  | null: false          |
| building_name       | string  |                      |
| phone_number        | string  | null: false          |

### Association 
- has_many :transaction
- Gem：jp_prefectureを使用して都道府県コードを取得

## items テーブル

| column              | Type   | Options               |
| ----------------    | ------ | ------------          |
| name                | string  | null: false          |
| introduction        | text    | null: false          |
| category_id         | integer | null: false          |
| condition_id        | integer | null: false          |
| shipping expense_id | integer | null: false          |
| ship-from area_id   | integer | null: false,user_id,foreign_key: true |
| processing time_id  | integer | null: false,user_id, foreign_key: true |
| selling price       | integer | null: false,user_id, foreign_key: true |


### Association 
- belongs_to :user, class_name: "User"
- belongs_to :transaction, class_name: "Transaction"


