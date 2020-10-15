class Admin::DashboardController < ApplicationController

  def show
    @total_products = Product.sum(:quantity)
    @total_categories = Category.count
    puts @total_categories
  end
end
