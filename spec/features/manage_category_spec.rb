require 'rails_helper'

describe 'a category' do

  include_context 'security'

  it 'can manage a category' do
    log_in_as(FactoryGirl.create :admin)

    visit new_category_path
    fill_in :category_name, with: 'Test Category'
    click_on "Create Category"

    visit root_path
    expect(page).to have_text("Test Category")

    # update
    visit categories_path
    click_link 'Edit', '/admin/categories/2/edit'
    fill_in :category_name, with: 'Test Category Updated'
    click_on 'Update Category'
    expect(page).to have_text 'Test Category Updated'

    #destroy
    visit categories_path
    expect { click_link 'Destroy' }.to change(Category, :count).by(-1)

  end

end