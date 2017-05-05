class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    sum = 0
    line_items.each{|li| sum += (li.quantity * (li.item.price.to_f/100)) }
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
    line_items.each {|line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save }
  end
end
