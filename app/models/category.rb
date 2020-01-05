class Category < ApplicationRecord
	has_many :product_groups, dependent: :destroy
end
