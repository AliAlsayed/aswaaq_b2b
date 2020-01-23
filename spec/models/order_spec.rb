require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:product1) { create :product, price_cents: 50_00 }
  let(:product2) { create :product, price_cents: 50_00 }
  let(:order) { create :order }

  before do
 		create :line_item, product: product1, order: order, quantity: 2
 		create :line_item, product: product2, order: order, quantity: 4
  end 


  describe "#refresh_total" do
		it "calculates total price" do
			order.refresh_total
			expect(order.total_price_cents).to eq(300_00)
		end
  end

end
