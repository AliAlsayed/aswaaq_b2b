# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :product_group
  has_many :line_items
  has_many :orders, through: :line_items
  monetize :price_cents
end
