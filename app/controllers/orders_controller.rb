class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
      @item = Item.find(params[:item_id])
    end
  
    def new
      @item = Item.find(params[:item_id])
      @cart_address = CartAddress.new
    end
  
    def create
      @cart_address = CartAddress.new(cart_params)
      if @cart_address.valid?
        @cart_address.save
        redirect_to root_path
      else
        render template: "order/index"
      end
    end

   private

   def order_params
     params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end

  #  def pay_item
  #    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  #    Payjp::Charge.create(
  #      amount: @item.price,        # 商品の値段
  #      card: order_params[:token], # カードトークン
  #      currency: 'jpy'             # 通貨の種類（日本円）
  #    )
  #  end


    #  @item = Item.find(params[:item_id])
    #  redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
    #end
end