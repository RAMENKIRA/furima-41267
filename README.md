# README

## usersテーブル

|Column                   |Type      |Options                        |
| ------------------      | ------   | ------------------------------|
|email                    |string    |null: false,unique:true        |
|encrypted_password       |string    |null: false                    |
|first_name               |string    |null: false                    |
|last_name                |string    |null: false                    |
|katakana_last_name       |string    |null: false                    |
|katakana_first_name      |string    |null: false                    |
|nickname                 |string    |null: false                    |

### Association
has_many :items
has_many :purchases



## Itemsテーブル

|Column              |Type            |Options                        |
| ------------------ | ------         | ------------------------------|
|seller              |string          |null: false                    |
|item_name           |string          |null: false                    |
|item_name           |string          |null: false                    |
|item_image          |string          |null: false                    |
|description         |text            |null: false                    |
|price               |string          |null: false                    |
|category            |string          |null: false                    |
|condition           |string          |null: false                    |
|shipping_free       |string          |null: false                    |
|shipping_from       |string          |null: false                    |
|shipping_days       |string          |null: false                    |
|user                |references      |null: false,foreign_key: true  |
|articles            |references      |null: false,foreign_key: true  |


### Association
has_many :articles
has_many :purchases
belongs_to :genre
belongs_to :user



## purchasesテーブル
|Column   |Type      |Options                      |
| ------- | ------   | ----------------------------|
|user     |references|null: false,foreign_key: true|
|item     |references|null: false,foreign_key: true|

### Association
belongs_to :user
belongs_to :item

## shippingInfosテーブル

|Column              |Type      |Options                       |
| ------------------ | ------   | ---------------------------- |
|purchase            |references|null: false,foreign_key: true |
|postcode            |string    |null: false                   |
|prefecture          |string    |null: false                   |
|municipalities      |string    |null: false                   |
|block_number        |string    |null: false                   |
|building_name       |string    |                              |
|telephone_number    |string    |null: false                   |

### Association
belongs_to :purchase