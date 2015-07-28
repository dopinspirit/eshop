require 'rails_helper'
include Warden::Test::Helpers

describe 'explore a product' do

  include_context 'security'

  before(:example) do
    @product = FactoryGirl.create(:product)
    log_in_as(FactoryGirl.create :user)
  end

  it 'can explore a product', :js do

    visit root_path
    expect(page).to have_selector '.single-products'
    expect(page).to have_selector("#image_#{@product.id}")

    page.find("#image_#{@product.id}").click

    expect(page).to have_text 'Review'

    fill_in :review_msg, with: 'Test Review'
    click_on 'Add Review'

    expect(page).to have_text 'Test Review'

  end

end