class OrdersController < ApplicationController
    before_action :authenticate_user!, except: :index

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
end