## Users

|Column                | Type     | Options                   |
|----------------------|--------- |---------------------------|
| nickname             | string   | null: false               |
| email                | string   | null: false, unique: true |
| encrypted_password   | string   | null: false               |
| first-name           | string   | null: false               |
| first-name-furigana  | string   | null: false               |
| last-name            | string   | null: false               |
| last-name-furigana   | string   | null: false               |
| birth-date           | datetime | null: false               |


### Association
has_many items
has_many purchases

## items

|Column            |Type        |Options                         |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| delivery-fee_id  | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| delivery-time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association
has_one purchase
belongs_to user

## purchases

|Column|Type         |Options                         |
|------|-------------|--------------------------------|
| user | references  | null: false, foreign_key: true |
| item | references  | null: false, foreign_key: true |

### Association
belongs_to user
belongs_to item
has_one address

## addresses

|Column        |Type        |Options                        |
|--------------|------------|-------------------------------|
| postal-code  | string     | null: false                   |
| area_id      | integer    | null: false                   |
| address      | string     | null: false                   |
| building     | string     |                               |
| phone-number | string     | null: false                   |
| purchase     | references | null: false, foreign_key: true|

### Association
belongs_to purchase