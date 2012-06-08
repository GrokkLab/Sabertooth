require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"

  it "should do something" do
    names = %w{ grey red blue green yellow orange }
    names.map.with_index do |name, i|
      puts "#{name} has rank #{i}"
    end
  end


  it "should do act like a tree" do
    puts "howdy"
    root      = Item.create("item_code" => "root")
    child1    = root.children.create("item_code" => "child1")
    subchild1 = child1.children.create("item_code" => "subchild1")

    puts root.parent   # => nil
    puts child1.parent.item_code # => root
    puts root.children # => [child1]
    root.children.each { |child|
      puts child.item_code
    }

    puts root.children.first.children.first # => subchild1
  end

end
