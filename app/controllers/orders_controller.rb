class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.pet = Pet.find_by(id: params[:pet_id])
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.pet_id = params[:pet_id] # Set the pet_id directly

    if @order.save
      redirect_to pet_path(@order.pet_id) # Use pet_id to redirect
    else
      render :new
    end
  end
end
