class CarsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params) do |car|
      car.user = current_user
    end
    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
      respond_to do |format|
        if @car.update(car_params)
          format.html { redirect_to @car, notice: 'Car was successfully updated.' }
          format.json { render :show, status: :ok, location: @car }
        else
          format.html { render :edit }
          format.json { render json: @car.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @car.destroy
      respond_to do |format|
        format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:brand, :seats, :user_id)
    end
end

