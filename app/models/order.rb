class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items

  accepts_nested_attributes_for :line_items

  def refresh_total
    self.total_price_cents = self.line_items.sum(:price_cents)
    self.save
	end
end
