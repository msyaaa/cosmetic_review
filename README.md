# テーブル設計
## users テーブル
|      Column       |  Type  |   Options   |
| ----------------- | ------ | ----------- |
|      nickname     | string | null: false |
|      email        | string | null: false |
|      password     | string | null: false |
| password_confirmation | string | null: false |
|     birthday      |  date  | null: false |
|     introduce     |  text  |

### Association
- has_many :posts
- has_many :likes

## posts テーブル
|     Column     |  Type  |   Options   |
| -------------- | ------ | ----------- |
|      name      | string | null: false |
|   category_id  | integer | null: false |
|      price     | integer | null: false |
|   description  |  text   | null: false |
|   evaluation   |  float  | null: false |
|    shop_name   | string |
|      user      | references | null: false, foreign_key: true |

### Association
- has_many :likes, dependent: :destroy
- belongs_to :user
- belongs_to_active_hash :category

## likes テーブル
|   Column   |    Type    |   Options   |
| ---------- | ---------- | ----------- |
|   user  | references | null: false, foreign_key: true |
|   post  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post