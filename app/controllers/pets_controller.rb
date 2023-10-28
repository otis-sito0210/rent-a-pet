class PetsController < ApplicationController
  before_action :set_pet, only: [:show]
  def index
    @pets = Pet.all
  end

  def my_pets_index
    @pets = Pet.where(user_id: current_user.id)
  end

  def show
    @order = Order.new
  end

  def new
    @pet = Pet.new
  end

  def create
  @pet = Pet.new(pet_params)
  @pet.user = current_user
    if @pet.save!
      redirect_to pet_path(@pet), notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :details, :price, :size, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
