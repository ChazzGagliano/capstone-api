class OrdersController < ApplicationController
  before_action :authenticate_user


  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    render :show
  end

  def index
    @orders = current_user.orders
    render :index 
  end

  def create
    @order = Order.new(
 
    product_id: params[:product_id],
    quantity: params[:quantity],
    subtotal: params[:subtotal],
    user_id: current_user.id
    )
    if @order.save
      render :show
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
