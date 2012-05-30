class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_code
      t.string :category
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
