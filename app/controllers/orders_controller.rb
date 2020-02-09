# frozen_string_literal: true

class OrdersController < ApplicationController
	def create
		order = current_user.orders.new
		session[:cart].each do |product_id, quantity|
			# find the product the the line_item belongs to. we need it to set the price of the
			# line_item as well
			product = Product.find(product_id.to_i)
			order.line_items << LineItem.create(quantity: quantity, product: product)
		end
		#this instance method also saves the order
		order.refresh_total
		session[:cart] = nil
		redirect_to root_path
	end
end
