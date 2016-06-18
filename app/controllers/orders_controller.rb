class OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy, :add_item, :remove_item]

  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.new
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = current_user.orders.new(balcony_params)
    authorize @order
    if @order.save
      redirect_to order_path
    else
      render :new
    end
  end

  def complete
    @order = current_user.balconies.last
    authorize @order
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to order_path(@order)
      flash[:notice] = "order successfuly edited"
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to profile_path
  end

  def add_item
    @item = Item.find(params[:item])
    @order.add_item(@item)

    if @order.save
      redirect_to complete_path
      flash[:notice] = "Item added to your balcony"
    else
      redirect_to complete_path
      flash[:alert] = "Item not added to your balcony"
    end
  end

  def remove_item
    @item = Item.find(params[:item])
    @order.remove_item(@order)

    if @order.save
      redirect_to complete_path
      flash[:notice] = "Item removed from your order"
    else
      redirect_to complete_path
      flash[:alert] = "Item not removed to your order"
    end
  end

  private

  def order_params
    params.require(:balcony).permit(:model, :address, :city, :department, :length, :orientation, :photo, :photo_cache)
  end

  def set_balcony
    @order = Order.find(params[:id])
    authorize @order
  end

end
