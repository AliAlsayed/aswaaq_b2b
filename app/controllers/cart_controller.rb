class CartController < ApplicationController
  def index
  end

  def add_to_cart
    current_cart[params[:product_id]] ||= 0
    current_cart[params[:product_id]] += params[:quantity].to_i
    redirect_back fallback_location: root_path
  end

  def update_cart
  end
end
