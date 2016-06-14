class BalconiesController < ApplicationController

  skip_before_action :authenticate_user!
  before_action :set_balcony, only: [:show, :edit, :update, :destroy]

  def index
    @balconies = Balcony.all
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
    @balcony.user_id = current_user.id if current_user
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
      flash[:notice] = "Food truck successfuly edited"
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
  end

end
