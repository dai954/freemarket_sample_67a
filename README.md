# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|email|string|null: false|
|password|string|null: false|
|tel|string|null: false|
|sex|string|null: false|
|birthday|string|null: false|
|block|string|null: false|
### Association
- has_many :categorys
- has_many :credits
- has_many :items
- has_many :addresses
## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|genre|text|null: false|
|subgenre|text|null: false|
|detail|text|null: false|
### Association
- has_many :items
## creditテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|number|text|null: false|
|security|text|null: false|
|company|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|like|integer|null: false|
|price|integer|null: false|
|status|text|null: false|
|brand|text|null: false|
|description|text|null: false|
|burden|text|null: false|
|method|text|null: false|
|indication|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|address_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :address
- belongs_to :category
- has_many :images
- has_many :comments
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|text|null: false|
|post|text|null: false|
|city|text|null: false|
|number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
### Association
- has_many :items