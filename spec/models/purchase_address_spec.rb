require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報と発送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name = ""
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'shipment_source_idが1以外を選択していないと保存できないこと' do
        @purchase_address.shipment_source_id = "1"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_address.municipalities = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_address.telephone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが全角数字だと保存できないこと' do
        @purchase_address.telephone_number = "０１２３４５６７８９"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが9桁以下では保存できないこと' do
        @purchase_address.telephone_number = "012345678"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12桁を超過すると保存できないこと' do
        @purchase_address.telephone_number = "012345678901"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
