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
- has_many  :items,  through:  :item_categorys
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
- has_many :images
- has_many :comments
- has_many :item_categories
- has_many :category
- has_many  :categories,  through:  :item_categorys
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image1|image|null: false|
|image2|image|null: false|
|image3|image|null: false|
|image4|image|null: false|
|image5|image|null: false|
|image6|image|null: false|
|image7|image|null: false|
|image8|image|null: false|
|image9|image|null: false|
|image10|image|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|image|null: false|
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
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :category
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
### Association
- has_many :items