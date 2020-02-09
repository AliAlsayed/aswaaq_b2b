# frozen_string_literal: true

class ProductGroup < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :category
end
