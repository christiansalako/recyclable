class AddProducerToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :producer, :boolean, default: false
  end
end
