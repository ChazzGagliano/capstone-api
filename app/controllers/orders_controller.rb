class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

  def index
    @orders = Order.all
    render :index
  end

  def create
    @order = Order.new(
    user_id: current_user.id, 
    product_id: params[:product_id],
    quantity: params[:quantity],
    subtotal: params[:subtotal]
    )
    if @order.save
      render :show
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
