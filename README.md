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
- has_one  : sending_destination, dependent: :destroy



## transaction (取引管理) テーブル
| column           | Type       | Options          |
| ---------------- | ---------- | ---------------- |
| user_id          | references | foreign_key:true |
| item_id          | references | foreign_key:true |

### Association 
- belongs_to: user
- belongs_to: item


## sending_destination テーブル

| column           | Type    | Options                      |
| ---------------- | ------  | ------------                 |
| post_code        | string  | null: false                  |
| prefecture_code  | integer | null: false                  |
| city             | string  | null: false,foreign_key:true |
| house_number     | string  | null: false,foreign_key:true |
| building_name    | string  | foreign_key:true             |
| phone_number     | string  | null: false,foreign_key:true |

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
- belongs_to :user, class_name: "User"


## items テーブル