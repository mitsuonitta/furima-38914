require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  sleep 0.1
  describe '商品出品機能' do
    context '商品出品が投稿できる場合' do
       it "name、description、category_id、item_condition_id、postage_payer_id、prefecture_id、preparation_day、priceが存在していれば保存できる" do
         expect(@item).to be_valid
      end
    end
    context '商品出品が投稿できない場合' do
      it 'userが紐付いていないと保存できない' do
         @item.user = nil
         @item.valid?
         expect(@item.errors.full_messages).to include('User must exist')
       end
      it "nameが空では登録できない" do
         @item.name = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
       end
      it "descriptionが空では登録できない" do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
      it "priceが空では登録できない" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      it "preparation_dayが空では登録できない" do
          @item.preparation_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Preparation day is not a number")
        end
      it "categoryが空では登録できない" do
            @item.category_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Category is not a number")
          end
      it "item_conditionが空では登録できない" do
            @item.item_condition_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Item condition is not a number")
          end
      it "prefectureが空では登録できない" do
            @item.prefecture_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
      end
   end
end