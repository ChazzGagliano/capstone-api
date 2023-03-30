class ProductsController < ApplicationController
   def show
    @product = Product.find_by(id: params["id"])
    render :show
   end
   def index
    @products = Product.all
    render :index
   end

   def create
    @product = Product.new(
   name: params[:name], 
   price: params[:price], 
   image_url: params[:image_url],
   description: params[:description]
  )
  @product.save
  render :show
  end

  def update
  
  @product.save
  render :show
end
