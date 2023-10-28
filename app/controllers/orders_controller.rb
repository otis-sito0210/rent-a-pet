class OrdersController < ApplicationController
  def new
    @order = Order.new
    # @pet = Pet.find_by(id: params[:pet_id])
  end

  def my_orders_index
    @orders = Order.where(user_id: current_user.id)
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

    # if @order.save!
    #   # redirect_to pet_path(@order.pet_id) #posso tirar depois que criar o javascript
    # else
    #   render :new
    # end
    respond_to do |format|
      if @order.save!
        puts "created"
        format.html { redirect_to pet_path(@pet) }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "orders/form", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:pet_id)
  end
end
