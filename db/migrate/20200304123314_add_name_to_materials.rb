class AddNameToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :name, :string
  end
end
