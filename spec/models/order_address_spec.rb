require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep (1)
  end

  describe '購入できるとき' do
    context '購入できるとき' do
      it 'すべてのフォームの入力がされている' do
        expect(@order_address).to be_valid
      end
      it "tokenがあれば保存ができること" do
        expect(@order_address).to be_valid
      end
      it "建物名が空の場合でも保存できること" do
        @order_address.building_name = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'postal_code が空では登録できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '123ー4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが 1 では保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipality が空では保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'address が空では保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone が空では保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phone が英数混合では保存できないこと' do
        @order_address.phone = '００００００００aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is not a number")
      end
      it 'phone が11桁以内の数値のみでなければ保存できないこと' do
        @order_address.phone = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is not a number")
      end
      it 'phone が11桁以上では保存できないこと' do
        @order_address.phone = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it 'phone が9桁以下では保存できないこと' do
        @order_address.phone = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
      end
      it "token が空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "user_id が空では登録できないこと" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_id が空では登録できないこと" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
