# テーブル設計

## usersテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| name                | string | null: false               |
| name_initials       | string | null: false               |
| state_id            | string | null: false               |
| best-score          | string | null: false               |

### Association
- has_many :items
- has_many :buys
- has_many :rooms, through: :room_users
- has_many :photos


## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | -----------| ----------- |
| product             | string     | null: false |
| product_description | text       | null: false |
| category_id         | integer    | null: false |
| product_status_id   | integer    | null: false |
| price               | integer    | null: false |
| state_id            | integer    | null: false |
| freight_id          | integer    | null: false |
| due_date_id         | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy
- has_one_attached :image

## addressesテーブル

| Column              | Type       | Options     |
| ------------------- | -----------| ----------- |
| postal_code         | string     | null: false |
| state_id            | integer    | null: false |
| city                | string     | null: false |
| street              | string     | null: false |
| building_name       | string     |             |
| phone               | string    | null: false |
| buy                 | references | null: false, foreign_key: true |

### Association

- belongs_to :buy

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## photosテーブル

| Column            | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| title              | string     | null: false                    |
| club               | string     |                                |
| caption            | text       |                                |
| image              |            |                                |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users