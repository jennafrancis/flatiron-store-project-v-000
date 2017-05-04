class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    sum = 0
    items.each{|item| sum += item.price}
    sum
  end

  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = line_items.build(item_id: item_id)
    end
    line_item
  end

  def remove_items
    items.each {|item|
      item.inventory -= 1
      item.save }
  end
end
