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


aaaaaa
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
|name|string|null: false|
|number|string|null: false|
|security|integer|null: false|
|company|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|like|integer|null: false|
|price|integer|null: false|
|status|integer|null: false|
|brand|string|null: false|
|description|text|null: false|
|burden|string|null: false|
|method|string|null: false|
|indication|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :images
- has_many :comments
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
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
|prefecture|string|null: false|
|post|string|null: false|
|city|string|null: false|
|number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items
