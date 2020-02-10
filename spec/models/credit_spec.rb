require 'rails_helper'
describe Credit do
  describe '#pay' do
    it "is valid with a user_id, customer_id, card_id" do
      credit = FactoryBot.build(:credit)
      expect(credit).to be_valid
    end

    it "is invalid without a user_id" do
      credit = FactoryBot.build(:credit, user_id: "")
      credit.valid?
      expect(credit.errors[:user_id]).to include("can't be blank")
    end
    it "is invalid without a customer_id" do
      credit = FactoryBot.build(:credit, customer_id: "")
      credit.valid?
      expect(credit.errors[:customer_id]).to include("can't be blank")
    end
    it "is invalid without a card_id" do
      credit = FactoryBot.build(:credit, card_id: "")
      credit.valid?
      expect(credit.errors[:card_id]).to include("can't be blank")
    end
  end
end