class AddForeignKeyToProduct < ActiveRecord::Migration[5.2]
  def change
    change_table :products do |t|
      t.references :country_of_origins
    end
  end
end
