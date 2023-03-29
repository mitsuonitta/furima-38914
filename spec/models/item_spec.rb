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
         expect(@item.errors.full_messages).to include("Userを入力してください")
       end
       it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
       end
       it "nameが空では登録できない" do
         @item.name = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("商品名を入力してください")
       end
       it "descriptionが空では登録できない" do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("説明文を入力してください")
       end
       it "priceが空では登録できない" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("金額は数値で入力してください")
       end
       it "priceが300未満だと出品できない" do
           @item.price = 299
           @item.valid?
           expect(@item.errors.full_messages).to include("金額は300以上の値にしてください")
       end
       it "priceが10000000以上だと出品できない" do
           @item.price = 10_000_000
           @item.valid?
           expect(@item.errors.full_messages).to include("金額は9999999以下の値にしてください")
       end
       it "priceが全角数字では出品できない" do
           @item.price = "１００００"
           @item.valid?
           expect(@item.errors.full_messages).to include("金額は数値で入力してください")
       end
       it "priceが半角英字では出品できない" do
           @item.price = "sample"
           @item.valid?
           expect(@item.errors.full_messages).to include("金額は数値で入力してください")
       end
       it "priceが半角英数字混合では出品できない" do
           @item.price = "sample1000"
           @item.valid?
           expect(@item.errors.full_messages).to include("金額は数値で入力してください")
       end
      it "preparation_dayが1以外でないと出品できない" do
          @item.preparation_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it "categoryが1以外でないと出品できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it "item_conditionが1以外でないと出品できない" do
          @item.item_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it "prefectureが1以外でないと出品できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it "postage_payerが1以外でないと出品できない" do
          @item.postage_payer_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
    end
  end
end