class CreateCountryOfOrigins < ActiveRecord::Migration[5.2]
  def change
    create_table :country_of_origins do |t|
      t.string :name

    end
  end
end
