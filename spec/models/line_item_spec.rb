# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:product) { create :product, price_cents: 50_00 }
  it 'calcutes the price' do
    line_item = create :line_item, product: product, quantity: 10

    expect(line_item.price_cents).to eq(500_00)
  end
end
