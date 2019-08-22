class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def show
    @number_of_products = Product.all.count
    @number_of_categories = Category.all.count
  end
end
