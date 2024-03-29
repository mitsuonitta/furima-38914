class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  #before_action :prevent_url, only: [:edit, :update, :destroy]


  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new (item_params)
     if @item.save
       redirect_to root_path
    else
       render :new
     end
  end

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
    redirect_to root_path
   end
  end

  def update
    @item.update(item_params)
      if @item.valid?
       redirect_to item_path
      else
        render :edit
    end
  end

  def show
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  private

  def item_params
     params.require(:item).permit(:image, :name, :description, :category_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
