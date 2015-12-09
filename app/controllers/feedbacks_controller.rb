class FeedbacksController < ApplicationController
  # load_and_authorize_resource
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def new
    @feedback = Feedback.new
  end

  def create
    case params[:target]
    when 'driver'
      @feedback = DriverFeedback.new(feedback_params)
    when 'passenger'
      @feedback = PassengerFeedback.new(feedback_params)
    else
      raise "arrrrggg!"
    end
    @feedback.target_id = params[:id]
    @feedback.user = current_user

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback.journey, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:comment, :rating)
    end

end