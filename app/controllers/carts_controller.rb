class CartsController < ApplicationController
  before_action :set_cart, only: [:destroy, :add_item, :remove_item]


  def add_item
    @item = Item.find(params[:item])
    @cart = @cart.first
    @cart.add_item(@item)

    if @cart.save
      redirect_to items_path
      flash[:notice] = "Item added to your cart"
    else
      redirect_to items_path
      flash[:alert] = "Item not added to your cart"
    end
  end

  def remove_item
    @item = Item.find(params[:item])
    @cart = @cart.first
    @cart.remove_item(@item)

    if @cart.save
      redirect_to cart_path(@cart)
      flash[:notice] = "Item removed from your cart"
    else
      redirect_to cart_path(@cart)
      flash[:alert] = "Item not removed to your cart"
    end
  end

  def destroy
    @cart.destroy
  end

  private

  def set_cart
    @cart = Cart.where(user_id: current_user.id)
    authorize @cart
    return @cart
  end
end
