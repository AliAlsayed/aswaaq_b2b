class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  helper_method :current_cart
  
  def current_cart
    session_cart ||= {}
  end

end
