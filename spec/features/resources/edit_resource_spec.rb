require 'rails_helper'

RSpec.feature 'Editing a resource', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  scenario 'updates the resource and shows the resource updated details' do
    resource = FactoryGirl.create(:resource)
    
    visit resource_url(resource)
    click_link 'Edit Resource'
    
    expect(current_path).to eq(edit_resource_path(resource))
    expect(find_field('Name').value).to eq(resource.name)
    
    fill_in 'Name', with: 'Updated Resource Name'
    click_button 'Update Resource'
    
    expect(current_path).to eq(resource_path(resource))
    expect(page).to have_content('Updated Resource Name')
  end
end