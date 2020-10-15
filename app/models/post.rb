class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    PRICE_VALIDATION = /\A[0-9]+\z/
    validates :price, format: { with: PRICE_VALIDATION }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 10_000_000 }
    validates :description, length: { maximum: 1000 }
    validates :image, presence: { message: 'を選択してください' }
    validates :evaluation, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0.5 }
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
  end
  validates :shop_name, length: { maximum: 50 }
end
