require 'rails_helper'

describe 'a product' do

  include_context 'security'

  before(:example) do
    log_in_as(FactoryGirl.create :admin)
    FactoryGirl.create :category
  end

  it 'can manage a product' do

    #create
    visit new_product_path
    fill_in :product_title, with: 'Test Product Title'
    fill_in :product_price, with: 30.5
    find('#product_category_id').find(:xpath, 'option[1]').select_option
    fill_in :product_description, with: 'Test Product Description'
    click_on 'Create Product'
    visit root_path
    expect(page).to have_text('Test Product Title')

    # update
    visit products_path
    click_link 'Edit'
    fill_in :product_title, with: 'Test Product Title Updated'
    click_on 'Update Product'
    expect(page).to have_text 'Test Product Title Updated'

    #destroy
    visit products_path
    expect { click_link 'Destroy' }.to change(Product, :count).by(-1)

  end

end