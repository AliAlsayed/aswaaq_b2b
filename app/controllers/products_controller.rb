class ProductsController < ApplicationController
  def index
    @category = Category.first
    @product_groups = @category.product_groups
    @products = @category.products
  end
end
