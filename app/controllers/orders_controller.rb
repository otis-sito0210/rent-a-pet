class OrdersController < ApplicationController
  def new
    @order = Order.new
    # @pet = Pet.find_by(id: params[:pet_id])
  end

  def create
    @order = Order.new
    @order.user = current_user
    @pet = Pet.find(params[:pet_id])
    @order.pet = @pet
    if params[:order][:date].present? #request do formulário se tem esse parâmetro
      @order.date = params[:order][:date]
    end
    # @order.pet_id = params[:pet_id]

    if @order.save!
      redirect_to pet_path(@order.pet_id)
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:pet_id)
  end
end