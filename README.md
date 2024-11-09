# README

## usersテーブル

|Column                   |Type      |Options                              |
| ------------------      | ------   | ------------------------------      |
|email                    |string    |null: false,unique:true              |
|encrypted_password       |string    |null: false                          |
|first_name               |string    |null: false                          |
|last_name                |string    |null: false                          |
|katakana_last_name       |string    |null: false                          |
|katakana_first_name      |string    |null: false                          |
|nickname                 |string    |null: false                          |
|birthday                 |date      |null: false                          |

### Association
has_many :items
has_many :purchases



## itemsテーブル

|Column                 |Type            |Options                        |
| ------------------    | ------         | ------------------------------|
|user                   |references      |null: false,foreign_key: true  |
|item_name              |string          |null: false                    |
|description            |text            |null: false                    |
|price                  |integer         |null: false                    |
|category_id            |integer         |null: false                    |
|condition_id           |integer         |null: false                    |
|shipping_fee_status_id |integer         |null: false                    |
|prefecture_id          |integer         |null: false                    |
|shipping_day_id       |integer         |null: false                    |




### Association
has_one :purchase
belongs_to :user



## purchasesテーブル
|Column   |Type      |Options                      |
| ------- | ------   | ----------------------------|
|user     |references|null: false,foreign_key: true|
|item     |references|null: false,foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :shipping_infos


## shipping_infosテーブル

|Column              |Type      |Options                       |
| ------------------ | ------   | ---------------------------- |
|purchase            |references|null: false,foreign_key: true |
|postcode            |string    |null: false                   |
|prefecture_id       |integer   |null: false                   |
|municipalities      |string    |null: false                   |
|block_number        |string    |null: false                   |
|building_name       |string    |                              |
|telephone_number    |string    |null: false                   |

### Association
belongs_to :purchase