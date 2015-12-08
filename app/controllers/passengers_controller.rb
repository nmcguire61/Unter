class PassengersController < ApplicationController
  # load_and_authorize_resource
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]


  def index
    @passengers = Passenger.all
  end

  def show
  end

  def new
    @journey = Journey.find(params[:journey_id])
    @passenger = Passenger.new
  end

  def edit
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @passenger = @journey.passengers.new(passenger_params)
    @passenger.status = "pending"
    respond_to do |format|
      if @passenger.save
        format.html { redirect_to @passenger.journey, notice: 'Passenger was successfully created.' }
        format.json { render :show, status: :created, location: @passenger }
      else
        format.html { render :new }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to @passenger, notice: 'Passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to passengers_url, notice: 'Passenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    def passenger_params
      params.require(:passenger).permit(:user_id, :journey_id, :status, :price)
    end
end