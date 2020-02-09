# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  monetize :price_cents

  before_validation :set_price

  private

  def set_price
    self.price = product.price * quantity
  end
end
