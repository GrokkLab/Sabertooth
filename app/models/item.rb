class Item < ActiveRecord::Base
  acts_as_tree :order => "item_code"
end
