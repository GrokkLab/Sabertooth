class Item < ActiveRecord::Base
  include ActsAsTree
  acts_as_tree order: "item_code"
end
