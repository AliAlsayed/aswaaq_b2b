class Product < ApplicationRecord
  belongs_to :product_group
  monetize :price_cents
end
