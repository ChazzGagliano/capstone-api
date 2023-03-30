class ProductsController < ApplicationController
  def singular
    @product = Product.find_by(id: 1)
    render template: "products/show"
  end
end
