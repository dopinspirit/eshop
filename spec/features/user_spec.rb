require 'rails_helper'

describe "users" do

  include_context 'security'

  let(:user) {User.create!(email: "tests@example.com", password: "password", admin: true)}

  it "allows an admin to view the manage products page" do
    log_in_as(user)
    visit products_path
    expect(current_path).to eq(products_path)
  end

  it "does not allow a user to see the manage products page " do
    expect{visit products_path}.to raise_error ActionController::RoutingError
  end

  it "allows an admin to view the manage categories page" do
    log_in_as(user)
    visit products_path
    expect(categories_path).to eq(categories_path)
  end

  it "does not allow a user to see the manage categories page " do
    expect{visit categories_path}.to raise_error ActionController::RoutingError
  end

end