class ChangeColumnNameForMaterial < ActiveRecord::Migration[6.0]
  def change
    rename_column :materials, :products_id, :product_id
  end
end
