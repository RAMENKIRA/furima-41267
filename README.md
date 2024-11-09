# README

## usersテーブル

|Column|Type|Options|
|user_id|references|null: false,foreign_key: true|
|email|string|null: false,unique:true|
|password|string|null: false|
|name|string|null: false|
|nickname|string|null: false|
|nickname|string|null: false|

Association
has_many



## Itemsテーブル

|Column|Type|Options|
|item_id|references|null: false,foreign_key: true|
|item_name|string|null: false|
|item_name|string|null: false|
|item_image|string|null: false|
|description|text|null: false|
|price|string|null: false|
|category|string|null: false|
|condition|string|null: false|
|shipping_free|string|null: false|
|shipping_from|string|null: false|
|shipping_days|string||null: false

Association
has_many


## purchasesテーブル
|Column|Type|Options|
|purchase_id|references|null: false,foreign_key: true|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false,foreign_key: true|

Association
belongs_to
belongs_to
has_one

## shippingInfosテーブル
|Column|Type|Options|
|shipping_id|references|null: false,foreign_key: true|
|purchase_id|references|null: false,foreign_key: true|
|postcode|string|null: false|
|prefecture|string|null: false|
|municipalities|string|null: false|
|block number|string|null: false|
|building name|string|null: false|
|telephone number|string|null: false|

Association
belongs_to