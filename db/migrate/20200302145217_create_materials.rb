class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :category
      t.boolean :recyclability
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
