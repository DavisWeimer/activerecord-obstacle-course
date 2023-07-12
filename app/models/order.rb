class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  def self.orders_between(attr, range_low, range_high)
    where("#{attr} >= ?", range_low).where("#{attr} <= ?", range_high)
  end

  def self.less_than(attr, value)
    where("#{attr}": 0...value)
  end

end
