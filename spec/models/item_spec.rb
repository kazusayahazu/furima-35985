require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '全項目が入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'imageが添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end

      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'textが空だと出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明テキストを入力してください")
      end

      it 'category_idが空だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it 'status_idが空だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it 'delivery_fee_idが空だと出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料負担を入力してください")
      end

      it 'shipment_source_idが空だと出品できない' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元地域を入力してください")
      end

      it 'days_idが空だと出品できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it 'priceが300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end

      it 'priceが10000000以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end

      it 'priceが全角数字だと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品者情報を入力してください")
      end
    end
  end
end
