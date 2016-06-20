class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy, :add_item, :remove_item]

  def show
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
    if current_user.orders.empty? || current_user.orders.last.status == true
      @order = Order.new
      @order.status = false
      @order.user_id = current_user.id
      @order.save
    else
      @order = curent_user.orders.last
    end
    authorize @order
    return @order
  end

end
