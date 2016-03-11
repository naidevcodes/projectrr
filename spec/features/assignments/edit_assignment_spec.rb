
require 'rails_helper'

RSpec.feature 'Editing an assignment', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  scenario 'saves the updated values' do
    project = FactoryGirl.create(:project)
    resource = FactoryGirl.create(:resource)
    
    assignment = Assignment.create!(
      project_id: project.id,
      resource_id: resource.id,
      start_date: '2015-07-15',
      end_date: '2015-08-31')
    
    visit edit_assignment_path(assignment)
    
    expect(page).to have_content(assignment.project.name)
    #expect(page).to have_content(assignment.end_date) FIX THIS
    
    fill_in 'End date', with: '2015-09-30'
    click_button 'Update Assignment'
    
    expect(current_path).to eq(assignment_path(assignment))
    expect(page).to have_content('2015-09-30')
    
  end
end