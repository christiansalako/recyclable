class Product < ApplicationRecord
  belongs_to :user
  has_many :product_materials, dependent: :destroy
  has_many :materials, through: :product_materials
  validates :name, presence: true
  validates :category, presence: true
  has_one_attached :photo

  def fully_recyclability
    array = materials.map(&:recyclability)
    return 100 if array.uniq.size == 1 && array.first
    
    count_recyclable = array.count(true)
    percentage = (count_recyclable.to_f / array.size) * 100
    return percentage
  end
end
