class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_code
      t.string :category
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
