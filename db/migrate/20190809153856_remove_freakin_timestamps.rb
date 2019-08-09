class RemoveFreakinTimestamps < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :created_at
    remove_column :products, :updated_at
  end
end
