class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  monetize :price_cents

  before_validation :set_price

  private

  def set_price
    self.price = self.product.price * self.quantity
  end
end
