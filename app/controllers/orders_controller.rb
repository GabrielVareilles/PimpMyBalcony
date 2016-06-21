class OrdersController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @order = Order.where(user_id: current_user.id).where(state: 'paid').find(params[:id])
    @cart = Cart.where(order_id: @order.id).first
  end

  def create
    @cart = Cart.where(user_id: current_user.id).last
    order  = Order.create!(amount: @cart.price, state: 'pending', user_id: current_user.id)
    @cart.update(order_id: order.id)
    redirect_to new_order_payment_path(order)
  end
end
