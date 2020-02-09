# frozen_string_literal: true
class CartController < ApplicationController
  def index
    @products = []
    cart = session[:cart] 
    cart.keys.each{|key| @products << Product.find(key.to_i)} if cart
    @total = @products.map{|product| product.price_cents * session[:cart][product.id.to_s]}.reduce(:+)
  end

  def add_to_cart
    cart = CartService.new(session[:cart])
    cart.add(params[:product], params[:quantity])
    session[:cart] = cart.data
    redirect_back fallback_location: root_path
  end

  def update_cart
    checked = params[:checked_product_ids]
    product_ids = params[:product_ids]
    product_quantities = params[:product_quantities]
    #check if any products are checked for removal from cart
    if checked
      checked.each_with_index do |id, index| 
        session[:cart].delete(id)
        # delete the ids and quantities from params since we don't want do edit them after
        # deleting them 
        product_ids.delete_at(index)
        product_quantities.delete_at(index)
      end
    end
    #now we can edit whatever we are left with
    product_ids.each_with_index do |id, index|
      session[:cart][id] = product_quantities[index].to_i
    end
    redirect_to root_path
  end
end
