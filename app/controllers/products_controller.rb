class ProductsController < ApplicationController
  def sole
    @product = Product.first
    render template: "products/show"
  end
  def index
    @products = Product.all
    render template: "products/index"
  end
end
