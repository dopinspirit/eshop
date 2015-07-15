require 'rails_helper'

describe Review do
  let(:review) {FactoryGirl.build :review}

  it "has validations" do
    should validate_presence_of :msg
    should validate_presence_of :product_id
    should validate_presence_of :user_id
  end

  it "has relationship with product" do
    should belong_to :product
    should belong_to :user
  end

  it "saved successfully" do
    expect(review.save).to be_truthy
  end
end