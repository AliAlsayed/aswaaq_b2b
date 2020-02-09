# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @product_groups = @category.product_groups
    @products = @category.products
  end
end
