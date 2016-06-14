class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @items = policy_scope(Item)
  end

  def show
    @item = Item.find(params[:id])
    autorize @item
  end
end
