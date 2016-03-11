require 'rails_helper'

RSpec.feature 'Creating a new assignment', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario 'succeeds with valid values' do
    project = FactoryGirl.create(:project)
    resource1 = FactoryGirl.create(:resource)
    
    visit new_assignment_path
    
    select project.name, from: 'assignment_project_id'
    select resource1.name, from: 'assignment_resource_id'
    click_button 'Create Assignment'
    
    expect(current_path).to eq(assignment_path(Assignment.last))
    expect(page).to have_content(Assignment.last.project.name)
  end
end