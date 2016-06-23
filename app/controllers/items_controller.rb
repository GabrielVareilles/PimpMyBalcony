class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_after_action :verify_authorized
  before_action :set_item, only: [:add_plant, :remove_plant, :duplicate, :destroy]

  def index
    @items = policy_scope(Item)
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def destroy
    @item.destroy
    redirect_to complete_path
  end

  def duplicate
    my_pot = Item.new({
                    name: params[:name].to_s + '\' s pot',
                    category: "Custom",
                    description: "to do",
                    price: @item.price,
                    slot: @item.slot,
                    volume: @item.volume,
                    length: @item.length,
                    width: @item.width,
                    weight: @item.weight
                    })
    my_pot.remote_photo_url = @item.photo.to_s
    if my_pot.save
      redirect_to complete_path
    else
      redirect_to complete_path
    end
  end

  def add_plant
    if @item.plants.size < @item.slot
      @plant = Plant.find(params[:plant])
      @item.add_plant(@plant)

      if @item.save
        redirect_to complete_path
        flash[:notice] = "Plant added to your item"
      else
        redirect_to complete_path
        flash[:alert] = "Plant not added to your item"
      end
    else
      flash[:alert] = "No room left in this pot, pick another one !"
      redirect_to complete_path
    end
  end

  def remove_plant
    @plant = Plant.find(params[:plant])
    @item.remove_plant(@plant)

    if @item.save
      redirect_to complete_path << '#anchor_1'
      flash[:notice] = "Plant removed from your item"
    else
      redirect_to complete_path
      flash[:alert] = "Item not removed to your item"
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end
end
