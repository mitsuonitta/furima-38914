class ItemsController < ApplicationController
  # before_action :set_furima, only: [:edit, :update, :destroy]
  # before_action :prevent_url, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :item_purchase ,only: :edit
  # before_action :move_to_index, except: [:index, :show]
  # validates :content, presence: true, unless: :was_attached?

  def index
    @item = Item.all.order("created_at DESC")

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
  end

  # def was_attached?
  #   self.image.attached?
  # end

  # def move_to_index
  #   redirect_to new_user_session_path unless user_signed_in?
  # end

  # def update
  #   if @item.save
  #     redirect_to item_path
  #   else
  #     render :edit
  #   end
  # end

  # def show
  # end

  # def destroy
  #   if current_user.id == @item.user_id
  #   if @items.destroy
  #   end 
  #     redirect_to root_path
  #  end
  # end

  # def  item_purchase
  #   @item = Item.find(params[:id])
  #    if @item.purchase
  #     redirect_to root_path
  #    end
  #  end
  
  private

  def item_params
     params.require(:item).permit(:image, :name, :description, :category_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  # def set_furima
  #    @item = Item.find(params[:id])
  # end
  # def prevent_url
  # if @item.user_id != current_user.id || @item.purchase != nil #　コードを追加
  #   redirect_to root_path
  # params {A: aa, item:{name: jj} ,B:b}
  # param.require(:item).permit(:name)
  # end
  # end
end
