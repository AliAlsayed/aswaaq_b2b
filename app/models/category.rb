class Category < ApplicationRecord
	has_many :product_groups, dependent: :destroy
	has_many :products, through: :product_groups
end
