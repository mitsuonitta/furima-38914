require 'rails_helper'

RSpec.describe OrderAddresse, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_addresse = FactoryBot.build(:order_addresse, user_id: user.id, item_id: item.id)
  end
  sleep 0.1
  describe '配送先情報の保存' do
    context '配送先情報の保存ができる場合' do
       it "user_id、item_id、post_code、prefecture_id、city、house_number、phone_numherが存在していれば保存できる" do
        expect(@order_addresse).to be_valid
      end
      # it 'user_idが空でなければ保存できる' do
      #   @order_addresse.user_id = 1
      #   expect(@order_addresse).to be_valid
      # end
      # it 'item_idが空でなければ保存できる' do
      #   @order_addresse.item_id = 1
      #   expect(@order_addresse).to be_valid
      # end
      # it '郵便番号が「3桁+ハイフン+4桁」の組み合わせであれば保存できる' do
      #   @order_addresse.post_code = '123-4560'
      #   expect(@order_addresse).to be_valid
      # end
      # it '都道府県が「---」以外かつ空でなければ保存できる' do
      #   @order_addresse.prefecture_id = 2
      #   expect(@order_addresse).to be_valid
      # end
      # it '市区町村が空でなければ保存できる' do
      #   @order_addresse.city = '横浜市'
      #   expect(@order_addresse).to be_valid
      # end
      # it '番地が空でなければ保存できる' do
      #   @order_addresse.house_number = '旭区１２３'
      #   expect(@order_addresse).to be_valid
      # end
      # it '建物名が空でも保存できる' do
      #   @order_addresse.building_name = nil
      #   expect(@order_addresse).to be_valid
      # end
      # it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
      #   @order_addresse.phone_numher = 12_345_678_910
      #   expect(@order_addresse).to be_valid
      # end
    end

    context '配送先情報の保存ができない場合' do
      it 'user_idが空だと保存できない' do
        @order_addresse.user_id = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空だと保存できない' do
        @order_addresse.item_id = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Itemを入力してください")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_addresse.post_code = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Post codeを入力してください")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_addresse.post_code = 1_234_567
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Post codeis invalid. Include hyphen(-)")
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_addresse.prefecture_id = 1
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Prefecturecan't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_addresse.prefecture_id = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Prefectureを入力してください")
      end
      it '市区町村が空だと保存できないこと' do
        @order_addresse.city = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Cityを入力してください")
      end
      it '番地が空だと保存できないこと' do
        @order_addresse.house_number = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("House numberを入力してください")
      end
      it '電話番号が空だと保存できないこと' do
        @order_addresse.phone_numher = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Phone numherを入力してください")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_addresse.phone_numher = '123 - 1234 - 1234'
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Phone numherは不正な値です")
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_addresse.phone_numher = 12_345_678_910_123_111
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Phone numherは不正な値です")
      end
      it 'トークンが空だと保存できないこと' do
        @order_addresse.token = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Tokenを入力してください")
      end
    end
  end
end

