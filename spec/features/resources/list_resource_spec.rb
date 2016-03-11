require 'rails_helper'

RSpec.feature 'Listing all resources', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  scenario 'returns a message when there are no resources to view' do
    
    visit '/'
    click_link 'Resources'
    
    expect(current_url).to eq(resources_url)
    expect(page).to have_content('0 resources')
  end
  
  scenario 'displays the resources' do
    resource1 = Resource.create!(name: 'Test Resource 1', description: 'Testing purposes')
    resource2 = Resource.create!(name: 'Test Resource 2', description: 'Testing purposes')
    resource3 = Resource.create!(name: 'Test Resource 3', description: 'Testing purposes')
    
    visit '/'
    click_link 'Resources'
    
    expect(current_url).to eq(resources_url)
    expect(page).to have_content('3 resources')
    expect(page).to have_content(resource1.name)
    expect(page).to have_content(resource2.name)
    expect(page).to have_content(resource3.name)
    expect(page).to have_content(resource1.description)
    expect(page).to have_content(resource2.description)
    expect(page).to have_content(resource3.description)
  end
end