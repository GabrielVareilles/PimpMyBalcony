class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
