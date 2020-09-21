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

#テーブル設計

##users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
### Association
- has_many :items
- has_one  :profile

##profiles テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| first_name       | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| birth_date       | date       | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association
- belongs_to :user

##items テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| description          | string     | null: false                    |
| price                | integer    | null: false                    |
| image                | text       | null: false                    |
| category             | string     | null: false                    |
| condition            | string     | null: false                    |
| shipping_fee         | string     | null: false                    |
| ship_form            | string     | null: false                    |
| shipping_day         | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one    :customer

##customers テーブル
| Column         | Type         | Options                        |
| -------------- | ------------ | ------------------------------ |
| user           | references   | null: false, foreign_key: true |
### Association
- belongs_to  :user
- belongs_to  :item
- has_one     :credit_card
- has_one     :sending_destinations

##credit_cards テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| card_number          | integer    | null: false                    |
| cvc                  | integer    | null: false                    |
| exp_month            | integer    | null: false                    |
| exp_year             | integer    | null: false                    |
### Association
- belongs_to  :customer

##sending_destinations テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| prefecture           | string     | null: false                    |
| city                 | string     | null: false                    |
| house_number         | string     | null: false                    |
| building_name        | string     | default: ""                    |
| telephone_number     | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |
### Association
- belongs_to  :customer