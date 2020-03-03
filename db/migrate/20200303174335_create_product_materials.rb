class CreateProductMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :product_materials do |t|
      t.references :material, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
