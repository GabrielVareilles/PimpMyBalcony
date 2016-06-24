class BalconiesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_balcony, only: [:show_public, :show_private, :edit, :update, :destroy, :add_item, :remove_item, :add_collection_to_cart]

  def index
    @balconies = policy_scope(Balcony)
  end

  def show_public
    @review = Review.new
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
      redirect_to complete_path
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
      render json: @balcony
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
      render json: @balcony
      flash[:notice] = "Item removed from your balcony"
    else
      redirect_to complete_path
      flash[:alert] = "Item not removed to your balcony"
    end
  end

  def add_collection_to_cart
    @balcony.items.each do |item|
      @cart.add_item(item)
    end
    @cart.save
    render json: @cart
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
