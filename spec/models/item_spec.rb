require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品" do
    context "商品出品が上手くいく時" do
      it "name,description,price,category_id,condition_id,shipping_fee_id,ship_form_id,shipping_day_idが存在する時"do
      expect(@item).to be_valid
      end
      context "商品が出品されない時" do
        it "nameが空のだと出品できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "descriptionが空だと出品できない"do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it "imageが空だと出品できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "priceが空だと出品できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
        it "priceが全角数字だと出品できない" do
          @item.price = "５５５"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
        it "priceが299円以下だと出品できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
        it "priceが100,000,000円以上だと出品できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
        it "category_idが1だと出品できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "condition_idが1だと出品できない" do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
        it "shipping_fee_idが空だと出品できない" do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
        end
        it "ship_form_idが空だと出品できない" do
          @item.ship_form_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship form must be other than 1")
        end
        it "shipping_day_idが空だと出品できない" do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
        end
      end
    end
  end
end

