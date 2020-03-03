class Material < ApplicationRecord
  has_many :product_materials
  has_many :products, through: :product_materials
  validates :category, presence: true
end
