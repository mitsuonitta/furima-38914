require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  sleep 0.1
  describe '商品出品機能' do
    context '商品出品が投稿できる場合' do
       it "imageとname、description、category_id、item_condition_id、postage_payer_id、prefecture_id、preparation_day_id、priceが存在していれば保存できる" do
         expect(@iten).to be_valid
      end
    end
    context '商品出品が投稿できない場合' do
        it 'imageが空では保存できない' do
        @item.content = ''
        @item.image = nil
        @item.valid?
         expect(@item.errors.full_messages).to include("Content can't be blank")
      end
        it 'userが紐付いていないと保存できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      it "nameが空では登録できない" do
         @item.name = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("name can't be blank")
       end
       it "descriptionが空では登録できない" do
         @item.description = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("description can't be blank")
       end
       it "priceが空では登録できない" do
         @item.price = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("price can't be blank")
      end
    end
  end
end