require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    it "is invalid without a name" do
      item = FactoryBot.build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it "is invalid without a name" do
      item = FactoryBot.build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    it "is invalid without a name" do
      item = FactoryBot.build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end
    it "is invalid without a name" do
      item = FactoryBot.build(:item, descripstion: nil)
      item.valid?
      expect(item.errors[:descripstion]).to include("can't be blank")
    end
    it "is invalid without a name" do
      item = FactoryBot.build(:item, burden: nil)
      item.valid?
      expect(item.errors[:burden]).to include("can't be blank")
    end
    it "is invalid without a name" do
      item = FactoryBot.build(:item, method: nil)
      item.valid?
      expect(item.errors[:method]).to include("can't be blank")
    end
    it "is invalid without a name" do
      item = FactoryBot.build(:item, area_id: nil)
      item.valid?
      expect(item.errors[:area_id]).to include("can't be blank")
    end
    
  end
end