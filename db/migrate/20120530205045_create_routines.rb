class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :name
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
