class BalconiesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_balcony, only: [:show_public, :show_private, :edit, :update, :destroy, :add_item, :remove_item]

  def index
    @balconies = policy_scope(Balcony)
  end

  def show_public
  end

  def show_private
  end

  def new
    @balcony = Balcony.new
    authorize @balcony
  end

  def create
    @balcony = current_user.balconies.new(balcony_params)
    authorize @balcony
    if @balcony.save
      redirect_to complete_path
      flash[:notice] = "Balcony successfuly created, now pick some plants!"
    else
      flash[:alert] = "Balcony not created"
      render :new
    end
  end

  def complete
    @balcony = current_user.balconies.last
    authorize @balcony
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
    redirect_to profile_path
  end

  def add_item
    @item = Item.find(params[:item])
    @balcony.add_item(@item)

    if @balcony.save
      redirect_to complete_path
      flash[:notice] = "Item added to your balcony"
    else
      redirect_to complete_path
      flash[:alert] = "Item not added to your balcony"
    end
  end

  def remove_item
    @item = Item.find(params[:item])
    @balcony.remove_item(@item)

    if @balcony.save
      redirect_to complete_path
      flash[:notice] = "Item removed from your balcony"
    else
      redirect_to complete_path
      flash[:alert] = "Item not removed to your balcony"
    end
  end

  private

  def balcony_params
    params.require(:balcony).permit(:model, :address, :city, :department, :length, :orientation, :photo, :photo_cache)
  end

  def set_balcony
    @balcony = Balcony.find(params[:id])
    authorize @balcony
  end

end
