require 'rails_helper'

RSpec.describe CustomerDestination, type: :model do
  before do
    @customerdestination = FactoryBot.build(:customer_destination)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it 'カード情報と購入者情報が正しく入力されている時' do
        expect(@customerdestination).to be_valid
      end
      it '購入情報の中でbuilding_nameだけがない時' do
        @customerdestination.building_name = ''
        expect(@customerdestination).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'tokenが空の時' do
        @customerdestination.token = ''
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが『-』無しだと購入できない' do
        @customerdestination.postal_code = '1111111'
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが空だと購入できない' do
        @customerdestination.postal_code = ''
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが3桁-4桁じゃないと購入できない" do
        @customerdestination.postal_code = "12-12345"
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeが4桁-3桁じゃ購入できない" do
        @customerdestination.postal_code = "1234-567"
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが全角だと購入できない' do
        @customerdestination.postal_code = '１１１-１１１１'
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが1だと購入できない' do
        @customerdestination.prefecture_id = '1'
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと購入できない' do
        @customerdestination.city = ''
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと登録できない' do
        @customerdestination.house_number = ''
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと登録できない' do
        @customerdestination.telephone_number = ''
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "telephone_numberが12桁以上だと購入できない" do
        @customerdestination.telephone_number = "123456789101"
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telepone_numberに『-』が含まれていると購入できない' do
        @customerdestination.telephone_number = '090-111-111'
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが全角だと購入できない' do
        @customerdestination.telephone_number = '０９０１１７１１７１１'
        @customerdestination.valid?
        expect(@customerdestination.errors.full_messages).to include('Telephone number is invalid')
      end
    end
  end
end
