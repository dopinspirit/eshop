require 'rails_helper'

describe Category do
  let(:category) {FactoryGirl.build :category}

  it "has validation" do
    should validate_presence_of :name
  end

  it "has relationship with products" do
    should have_many :products
  end

  it "saved successfully" do
    expect(category.save).to be_truthy
  end
end