class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :add_item, :remove_item]

  def index
    @orders = policy_scope(Order)
  end

  def show
    if current_user.orders.last.status == false
      @order = current_user.orders.last
    else
      redirect_to new_order
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.oders.new
    @order.status = false
    authorize @order
    if @order.save
      redirect_to order_path(@order)
    else
    end
  end

  def add_item
    @item = Item.find(params[:item])
    @order.add_item(@item)

    if @order.save
      redirect_to order_path(@order)
      flash[:notice] = "Item added to your order"
    else
      redirect_to order_path(@order)
      flash[:alert] = "Item not added to your order"
    end
  end

  def remove_item
    @item = Item.find(params[:item])
    @order.remove_item(@item)

    if @order.save
      redirect_to order_path(@order)
      flash[:notice] = "Item removed from your order"
    else
      redirect_to order_path(@order)
      flash[:alert] = "Item not removed to your order"
    end
  end

  def destroy
    @order.destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

end
