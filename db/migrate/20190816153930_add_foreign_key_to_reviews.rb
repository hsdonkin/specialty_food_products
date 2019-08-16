class AddForeignKeyToReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :author

    change_table :reviews do |t|
      t.belongs_to :user, index: true 
    end
  end
end
