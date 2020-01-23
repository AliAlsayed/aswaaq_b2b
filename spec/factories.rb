require 'rails_helper'

FactoryBot.define do
  factory :category do
    sequence(:name) {|i| "Category #{i}"}
  end

  factory :product_group do
    sequence(:name) {|i| "Product group #{i}"}
    category
  end

  factory :product do
    sequence(:description) {|i| "Test product #{i}"}
    price_cents { 10_00 }
    product_group
  end
end
