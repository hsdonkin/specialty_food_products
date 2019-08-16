class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :cost
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
