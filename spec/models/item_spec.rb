require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  sleep 0.1
  describe '商品出品機能' do
    context '商品出品が投稿できる場合' do
       it "image、name、description、category_id、item_condition_id、postage_payer_id、prefecture_id、preparation_day、priceが存在していれば保存できる" do
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
       it "priceが300未満だと出品できない" do
           @item.price = 299
           @item.valid?
           expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
       end
       it "priceが10000000以上だと出品できない" do
           @item.price = 10_000_000
           @item.valid?
           expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
       end
       it "priceが全角数字では出品できない" do
           @item.price = "１００００"
           @item.valid?
           expect(@item.errors.full_messages).to include("Price is not a number")
       end
       it "priceが半角英字では出品できない" do
           @item.price = "sample"
           @item.valid?
           expect(@item.errors.full_messages).to include("Price is not a number")
       end
       it "priceが半角英数字混合では出品できない" do
           @item.price = "sample1000"
           @item.valid?
           expect(@item.errors.full_messages).to include("Price is not a number")
       end
      it "preparation_dayが1以外でないと出品できない" do
          @item.preparation_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Preparation day must be other than 1")
      end
      it "categoryが1以外でないと出品できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "item_conditionが1以外でないと出品できない" do
          @item.item_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end
      it "prefectureが1以外でないと出品できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "postage_payerが1以外でないと出品できない" do
          @item.postage_payer_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
      end
    end
  end
end