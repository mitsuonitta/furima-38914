class ItemsController < ApplicationController
  before_action :set_furima, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  def index
    @items = item.new
  end

  # def new
  # end
  #private


    # def set_furima
    #   @item = Item.find(params[:id])
    # end

    # def prevent_url
    # if @item.user_id != current_user.id || @item.purchase != nil #　コードを追加
    #   redirect_to root_path
    # end
  # end

end