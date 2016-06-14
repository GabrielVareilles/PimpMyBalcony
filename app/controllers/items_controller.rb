class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_after_action :verify_authorized

  def index
    @items = policy_scope(Item)
  end

  def show
    @item = Item.find(params[:id])
    autorize @item
  end
end
