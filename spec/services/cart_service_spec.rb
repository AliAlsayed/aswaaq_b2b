# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartService do
  let(:data) { {} }

  subject { described_class.new(data) }
  let(:product) { create :product }

  describe '#add' do
    it 'adds product to cart' do
      subject.add(product, 1)
      expect(subject[product]).to eq(1)
    end

    context 'when adding twice' do
      it 'calculates quantity correctly' do
        subject.add(product, 1)
        subject.add(product, 5)
        expect(subject[product]).to eq(6)
      end
    end

    it 'allows to pass product_id as first argument' do
      subject.add(product.id, 1)
      expect(subject[product]).to eq(1)
    end
  end

  describe '#update' do
    before do
      subject.add(product, 1)
    end

    it 'updates quantity of a product' do
      subject.update(product, 5)
      expect(subject[product]).to eq(5)
    end
  end

  describe '#remove' do
    before do
      subject.add(product, 1)
    end

    it 'removes the product' do
      subject.remove(product)
      expect(subject[product]).to be_nil
    end
  end
end
