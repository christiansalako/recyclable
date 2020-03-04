class Product < ApplicationRecord
  belongs_to :user
  has_many :product_materials, dependent: :destroy
  has_many :materials, through: :product_materials
  validates :name, presence: true
  validates :category, presence: true
  has_one_attached :photo

  def fully_recyclability?
    array = materials.map(&:recyclability).uniq
    array.size == 1 && array.first ? true : false
  end
end
