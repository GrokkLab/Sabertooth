class AddParentToItems < ActiveRecord::Migration
  def change
    add_column :items, :parent_id, :integer

  end
end
