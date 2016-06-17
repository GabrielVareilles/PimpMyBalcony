class UsersController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @balconies = current_user.balconies.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path
      flash[:notice] = "profile successfuly edited"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :picture, :first_name, :last_name, :created_at)
  end

  def set_user
    @user = current_user
  end
end
