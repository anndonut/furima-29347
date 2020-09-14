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
| birth_day        | date.strftime("%Y年%m月%d日")   | null: false |


### Association 
- has_many : items
- has_many : seller_items, foreign_key:"seller_id", class_name: "items"
- has_many : buyer_items, foreign_key:"buyer_id", class_name: "items"
- has_one  : profile, dependent: :destroy
- has_one  : sending_destination, dependent: :destroy
- has_one  : credit_card, dependent: :destroy


## transaction (取引管理) テーブル
| column           | Type       | Options          |
| ---------------- | ---------- | ---------------- |
| user_id          | references | foreign_key:true |
| item_id          | references | foreign_key:true |

### Association 
- belongs_to: user
- belongs_to: item


## sending_destination テーブル

| column           | Type   | Options      |
| ---------------- | ------ | ------------ |
| post_code        | integer | null: false |
| prefecture_code  | integer | null: false |
| city             | string  | null: false |
| house_number     | string  | null: false |
| building_name    | string  |             |
| phone_number     | string  | null: false |

### Association 
- belongs_to :user
- Gem：jp_prefectureを使用して都道府県コードを取得

## items テーブル

| column           | Type   | Options      |
| ---------------- | ------ | ------------ |
| name             | string  | null: false |
| introduction     | text    | null: false |
| category         | integer | null: false |
| condition        | integer | null: false |
| shipping expense | integer | null: false |
| ship-from area   | integer | null: false |
| processing time  | integer | null: false |
| selling price    | integer | null: false |


### Association 
- belongs_to :seller, class_name: "User"
- belongs_to :buyer,  class_name: "User"


