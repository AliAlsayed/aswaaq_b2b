# frozen_string_literal: true

module ApplicationHelper
  # def list_categories
  #   categories = Category.all
  #   categories.each do |category|
  #     link_to category.name, category, class: "nav-item nav-link"
  #   end
  # end

  def product_group_breadcrumb_li(product_group)
    if product_group
      content_tag(:li, product_group.name, class: 'breadcrumb-item active', "aria-current": 'page')
    else
      content_tag(:li, 'All PRODUCTS', class: 'breadcrumb-item active', "aria-current": 'page')
    end
  end

  def total_items_in_cart
    if session[:cart]
      session[:cart].map{|k, v| v}.reduce(:+)
    end
  end
end
