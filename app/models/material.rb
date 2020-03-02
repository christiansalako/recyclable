class Material < ApplicationRecord
  belongs_to :products
  validates :category, presence: true
  validates :recyclability, presence: true
end
