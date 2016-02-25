require 'rails_helper'

RSpec.feature 'Viewing a resource', type: :feature do
  scenario 'shows the resource details' do
    resource = FactoryGirl.create(:resource)
    
    visit resource_url(resource)
    
    expect(page).to have_content(resource.name)
    expect(page).to have_content(resource.description)
  end
end