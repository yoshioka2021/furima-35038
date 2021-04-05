## Users

|Column      | Type   | Options                   |
|------------|------- |---------------------------|
| nickname   | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| first-name | string | null: false               |
| last-name  | string | null: false               |
| birth-date | string | null: false               |


### Association
has_many items
has_many purchases

## items

|Column|Type|Options|
|---------------|------------|--------------------------------|
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| state         | string     | null: false                    |
| delivery-fee  | string     | null: false                    |
| area          | string     | null: false                    |
| delivery-time | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association
has_one item
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

|Column|Type|Options|
|------|----|-------|
| postal-code  | string | null: false                   |
| prefecture   | string | null: false                   |
| address      | string | null: false                   |
| building     | string | null: false                   |
| phone-number | string | null: false                   |
| purchase     | string | null: false, foreign_key: true|

### Association
belongs_to purchase