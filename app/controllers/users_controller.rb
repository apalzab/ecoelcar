class UsersController < ApplicationController

  before_action :authenticate_user!, :is_owner?, :only => [:edit, :update, :destroy]

  def index
  end

  def edit
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes user_params
      redirect_to @user
    else
      flash[:notice] = @user.errors.full_messages
      render 'edit'
      # redirect_to edit_user_path @user
    end
  end

  def is_owner?
    if current_user.id != User.friendly.find(params[:id]).id.to_i
      flash[:notice] = "Can't access to that place"
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :last_name, :username, :age, :photo, :drive_license_old, :hobbies, :description, :ocupation,
                                 vehicles_attributes: [:vehicle_brand_id, :vehicle_model_id, :id, :seats, :horse_power, :year_of_registration, :photo])
  end
end
