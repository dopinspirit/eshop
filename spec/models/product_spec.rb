require 'rails_helper'

describe Product do
  let(:product) {FactoryGirl.build :product}

  it "has validation" do
    should validate_presence_of :title
    should validate_presence_of :description
    should validate_presence_of :price
    should validate_presence_of :category_id
  end

  it "has relationship with category" do
    should belong_to :category
    should have_many :reviews
  end

  it "saved successfully" do
    expect(product.save).to be_truthy
  end
end