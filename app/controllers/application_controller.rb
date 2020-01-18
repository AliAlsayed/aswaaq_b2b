class ApplicationController < ActionController::Base
  def current_cart
    session_cart ||= {}
  end

  def add_to_cart
    fail
    if current_cart[params[:product_id]]
      current_cart[params[:product_id]] += params[:quantity].to_i
    else
      current_cart[params[:product_id]] = params[:quantity].to_i
    end
    redirect_back fallback_location: root_path
  end
end
