class RemoveProductFromMaterials < ActiveRecord::Migration[6.0]
  def change
    remove_reference :materials, :product, null: false, foreign_key: true
  end
end
