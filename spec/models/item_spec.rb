require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品機能' do
  context '商品出品が投稿できる場合' do
    it 'imageとname、description、category_id、item_condition_id、postage_payer_id、prefecture_id、preparation_day_id、priceが存在していれば保存できる' do
      expect(@iten).to be_valid
    end
  end
  context '画像が投稿できない場合' do
    it 'contentとimageが空では保存できない' do
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
  end
end
end
