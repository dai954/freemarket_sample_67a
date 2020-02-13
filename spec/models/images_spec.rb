require 'rails_helper'

describe Images do
  describe '#create' do
    it "is invalid without a name" do
      images = FactoryBot.build(:images, images: nil)
      images.valid?
      expect(images.errors[:images]).to include("can't be blank")
    end
  end
end