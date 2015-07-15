require 'rails_helper'

describe NavigatorController do

  let(:valid_attributes) { FactoryGirl.attributes_for :product }
  let(:valid_category_attributes) { FactoryGirl.attributes_for :category }
  let(:invalid_attributes) { FactoryGirl.attributes_for :product, title: "" }

  describe "GET #index" do
    it "assigns all products and categories as @products and @categories" do
      product = Product.create! valid_attributes
      category = Category.create! valid_category_attributes
      get :index, {}
      expect(assigns(:products)).to eq([product])
      expect(assigns(:categories)).to include(category)
    end
  end


end