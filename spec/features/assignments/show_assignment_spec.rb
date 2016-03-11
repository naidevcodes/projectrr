require 'rails_helper'

RSpec.feature 'Showing an assignment', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  scenario 'displays the assignment details' do
    project = FactoryGirl.create(:project)
    resource = FactoryGirl.create(:resource)
    assignment = Assignment.create!(
      project_id: project.id,
      resource_id: resource.id,
      start_date: '2015-07-15',
      end_date: '2015-08-31')
    
    visit assignment_path(assignment)
    
    expect(current_path).to eq(assignment_path(assignment))
    expect(page).to have_content(assignment.project.name)
    expect(page).to have_content(assignment.resource.name)
    expect(page).to have_content(assignment.start_date)
    expect(page).to have_content(assignment.end_date)
  end
end