class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :rating_avg, :phone_number, :description, :avatar)
    end
end