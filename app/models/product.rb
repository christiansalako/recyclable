class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  has_one_attached :photo
  has_one :material, dependent: :destroy, foreign_key: "products_id"
end
