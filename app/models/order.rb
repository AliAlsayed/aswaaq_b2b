# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items
  monetize :total_price_cents
  accepts_nested_attributes_for :line_items

  def refresh_total
    self.total_price_cents = line_items.map{|line_item| line_item.price_cents}.reduce(:+)
    save
  end
end
