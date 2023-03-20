class ItemsController < ApplicationController
  before_action :set_furima, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]
  #validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new (item_params)
     if @item.save
       redirect_to root_path
     else
       render :new
     end
  end

  def update
   if @items.update(items_params)
  #     redirect_to items_path(@prototype)
  #   else
  #     render :edit
     end
  end

  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end
  
  # def destroy
  #   if @items.destroy
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end
  # end
  private

  def item_params
     params.require(:item).permit(:image, :name, :description, :category_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end
    # def set_furima
    #   @item = Item.find(params[:id])
    # end

    # def prevent_url
    # if @item.user_id != current_user.id || @item.purchase != nil #　コードを追加
    #   redirect_to root_path
    # end
  # end
end
