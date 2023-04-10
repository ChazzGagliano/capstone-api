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
    description: params[:description],
    quantity: params[:quantity],
    supplier_id: params[:supplier_id]
    )
    @product.save
    render :show
      if @product.save
        render :show
      else
        render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
      end
    end
   



  def update
    @product = Product.find_by(id: params[:id]) || @product.title
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url =  params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.quantity = params[:quantity] || @product.quantity
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    if @product.save
      render :show
    else
      render json: {errors: "60 percent of the time, it works everytime."}
    end
  end
  
  def destroy 
    @recipe = Product.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "product destroyed"}
  end
end
