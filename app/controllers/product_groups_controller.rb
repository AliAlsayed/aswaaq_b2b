class ProductGroupsController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @product_groups = @category.product_groups
    @product_group = @product_groups.find(params[:id])
    @products = @product_group.products
  end
end
