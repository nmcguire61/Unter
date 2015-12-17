class JourneysController < ApplicationController
  load_and_authorize_resource
  before_action :set_journey, only: [:show, :edit, :update, :destroy]

  def index
    @journeys = Journey.all
  end

  def show
  end

  def new
    @journey = Journey.new
  end

  def edit
  end

  def create
    @journey = Journey.new(journey_params) do |journey|
      journey.user = current_user
      journey.status = "open"
      journey.driver = Driver.new(user: current_user)
    end

    respond_to do |format|
      if @journey.save
        format.html { redirect_to @journey, notice: 'Journey was successfully created.' }
        format.json { render :show, status: :created, location: @journey }
      else
        format.html { render :new }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @journey.update(journey_params)
        format.html { redirect_to @journey, notice: 'Journey was successfully updated.' }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @journey.destroy
    respond_to do |format|
      format.html { redirect_to journeys_url, notice: 'Journey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def close
    @journey = Journey.find(params[:journey_id])
    @journey.status = "closed"
    @journey.save
    redirect_to @journey
  end

  def open
    @journey = Journey.find(params[:journey_id])
    @journey.status = "open"
    @journey.save
    redirect_to @journey
  end

  private

    def set_journey
      @journey = Journey.find(params[:id])
    end

    def journey_params
      params.require(:journey).permit(:starting_point, :ending_point, :starting_time, :user_id, :status)
    end
end