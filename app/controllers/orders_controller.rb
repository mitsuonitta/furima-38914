class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :prevent_url, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_addresse = OrderAddresse.new
  end
  
  def new
    @order_addresse = OrderAddresse.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_addresse = OrderAddresse.new(order_addresse)
    if @order_addresse.valid?
      pay_item
      @order_addresse.save
      redirect_to root_path
    else
      render :index
    end
  end


   private

   def order_addresse
    params.require(:order_addresse).permit(:order_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_numher). merge(user_id: current_user.id, item_id: params[:item_id])
   end

   def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

   def prevent_url
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end