class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

   def show
    p current_user
    p current_user
    p current_user
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
    description: params[:description],
    quantity: params[:quantity],
    supplier_id: params[:supplier_id],
    user_id: current_user.id
    )
      if @product.save
        render :show
      else
        render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
      end
    end
   


  def update
    p current_user
    @product = Product.find_by(id: params[:id]) || @product.title
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
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
