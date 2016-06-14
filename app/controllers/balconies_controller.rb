class BalconiesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_balcony, only: [:show_public, :show_private, :edit, :update, :destroy]

  def index
    @balconies = policy_scope(Balcony)
  end

  def show_public
  end

  def show_private
  end

  def new
    @balcony = Balcony.new
  end

  def create
    @balcony = current_user.balconies.build(balcony_params)
    autorize @balcony
    if @balcony.save
      redirect_to private_balcony_path(@balcony)
      flash[:notice] = "Balcony successfuly created"
    else
      flash[:notice] = "Balcony not created"
      render :new
    end
  end

  def edit
  end

  def update
    if @balcony.update(balcony_params)
      redirect_to private_balcony_path(@balcony)
      flash[:notice] = "Balcony successfuly edited"
    else
      render :edit
    end
  end

  def destroy
    @balcony.destroy
    redirect_to balconys_path
  end

  private

  def balcony_params
    params.require(:balcony).permit(:name)
  end

  def set_balcony
    @balcony = Balcony.find(params[:id])
    autorize @balcony
  end

end
