# README

## users テーブル

| column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| password | string | null: false |
| email    | string | null: false |

### Association 
- has_many : items
- has_many : seller_items, foreign_key:"seller_id", class_name: "items"
- has_many : buyer_items, foreign_key:"buyer_id", class_name: "items"
- has_one  : profile, dependent: :destroy
- has_one  : sending_destination, dependent: :destroy
- has_one  : credit_card, dependent: :destroy

## profile テーブル

| column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birth_year       | date   | null: false |
| birth_month      | date   | null: false |
| birth_day        | date   | null: false |

### Association 
- belongs_to :user


## seller テーブル


## buyer テーブル


## sending_destination テーブル

| column           | Type   | Options      |
| ---------------- | ------ | ------------ |
| post_code        | integer | null: false |
| prefecture_code  | integer | null: false |
| city             | string  | null: false |
| house_number     | string  | null: false |
| building_name    | string  | null: false |
| phone_number     | integer | null: false |

### Association 
- belongs_to :user
- Gem：jp_prefectureを使用して都道府県コードを取得

## items テーブル

| column           | Type   | Options      |
| ---------------- | ------ | ------------ |
| image_url        | string  | null: false |
| item_name        | string  | null: false |
| introduction     | string  | null: false |
| category         | string  | null: false |
| condition        | string  | null: false |
| shipping expense | integer | null: false |
| ship-from area   | string  | null: false |
| processing time  | integer | null: false |
| selling price    | integer | null: false |
| sales_commission | integer | null: false |
| sales profit     | integer | null: false |

### Association 
- belongs_to :seller, class_name: "User"
- belongs_to :buyer,  class_name: "User"


## credit_card テーブル

| column           | Type   | Options      |
| ---------------- | ------ | ------------ |
| card_number      | integer | null: false |
| expiration_year  | integer | null: false |
| expiration_month | integer | null: false |
| security_code    | integer | null: false |

### Association 
- belongs_to :user
