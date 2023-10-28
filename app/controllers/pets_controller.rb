class PetsController < ApplicationController
  before_action :set_pet, only: [:show]
  def index
    @pets = Pet.all
    @order = Order.new

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pet: pet})
      }
    end
  end

  def my_pets_index
    @pets = Pet.where(user_id: current_user.id)
  end

  def show
    @order = Order.new

    if @pet.geocoded?
      @marker = {
        lat: @pet.latitude,
        lng: @pet.longitude
      }
    else
      # Handle the case where geocoding didn't succeed
      @marker = { lat: 0, lng: 0 }  # Default location or error handling
    end
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
    params.require(:pet).permit(:name, :details, :price, :size, :photo, :address)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
