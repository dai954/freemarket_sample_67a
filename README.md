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
|street|string|null: false|
|tel|string|null: false|
|sex|string|null: false|
|birthday|string|null: false|
|block|string|null: false|
|credit_id|integer|null: false, foreign_key: true|
### Association
- has_many :categorys
- has_many :credits
- has_many :items
- has_many :mens
- has_many :women
- has_many :kids
- has_many :sports
- has_many :interias
- has_many :leisures
## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|brand|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :items
- has_many :mens
- has_many :women
- has_many :kids
- has_many :leisures
- has_many :sports
- has_many :interias
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
|price|integer|null: false|
|status|text|null: false|
|brand|text|null: false|
|description|text|null: false|
|burden|text|null: false|
|method|text|null: false|
|origin|text|null: false|
|indication|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- has_many :images
- has_many :comments
- belongs_to :mens
- belongs_to :women
- belongs_to :kids
- belongs_to :leisures
- belongs_to :sports
- belongs_to :interias
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|image|null: false|
### Association
- belongs_to :item
- belongs_to :men
- belongs_to :woman
- belongs_to :kid
- belongs_to :leisure
- belongs_to :sport
- belongs_to :interia
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|image|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
## mensテーブル
|Column|Type|Options|
|------|----|-------|
|outer|text|null: false|
|inner|text|null: false|
|bottom|text|null: false|
|shoe|text|null: false|
|hat|text|null: false|
|accessory|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- has_many :users
- belongs_to :image
- has_many :categories
## womanテーブル
|Column|Type|Options|
|------|----|-------|
|outer|text|null: false|
|inner|text|null: false|
|bottom|text|null: false|
|shoe|text|null: false|
|hat|text|null: false|
|accessory|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- has_many :users
- belongs_to :image
- has_many :categories
## kidsテーブル
|Column|Type|Options|
|------|----|-------|
|outer|text|null: false|
|inner|text|null: false|
|bottom|text|null: false|
|shoe|text|null: false|
|hat|text|null: false|
|accessory|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- has_many :users
- belongs_to :image
- has_many :categories
## leisuresテーブル
|Column|Type|Options|
|------|----|-------|
|book|text|null: false|
|game|text|null: false|
|ticket|text|null: false|
|toy|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- has_many :users
- belongs_to :image
- has_many :categories
## interiasテーブル
|Column|Type|Options|
|------|----|-------|
|interia|text|null: false|
|komono|text|null: false|
|beauty|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- has_many :users
- belongs_to :image
- has_many :categories
## sportsテーブル
|Column|Type|Options|
|------|----|-------|
|car|text|null: false|
|kaden|text|null: false|
|camera|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :image
- has_many :users
- has_many :categories