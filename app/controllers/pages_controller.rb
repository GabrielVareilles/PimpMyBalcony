class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def home
  end

  def profile
    @user = current_user
    @balconies = current_user.balconies.all
  end

  def inspiration
    @balconies = Balcony.all
    @items = Item.all
  end

end
