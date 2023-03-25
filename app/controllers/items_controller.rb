class ItemsController < ApplicationController
  # before_action :prevent_url, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  # before_action :item_purchase ,only: :edit
  # before_action :move_to_index, except: [:index, :show #記述を上手く扱えれば機能する]
  # validates :content, presence: true, unless: :was_attached?

  def index
    @item = Item.all.order("created_at DESC")
    # if current_user == @item.user
    #    redirect_to root_path
    #   end
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
  if @item.user_id != current_user.id
    redirect_to root_path
  end
  end

  # def was_attached?
  #   self.image.attached?
  # end

  # def move_to_index
  #   redirect_to new_user_session_path unless user_signed_in?
  # end

  def update
    if @item.update(item_params)
       redirect_to item_path
      else
        render :edit
    end
  end

  def show
  end

  def destroy
    # ログインしているユーザーと同一であればデータを削除する
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  # def  item_purchase　 #記述を上手く扱えれば機能する
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
