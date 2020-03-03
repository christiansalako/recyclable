class Material < ApplicationRecord
  belongs_to :product, foreign_key: 'products_id'
  validates :category, presence: true
  validates :recyclability, presence: true
end
