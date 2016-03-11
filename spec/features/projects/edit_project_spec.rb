require 'rails_helper'

RSpec.feature 'Editing a project', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
   
  scenario 'updates the project and shows the project updated details' do
    project = FactoryGirl.create(:project)
    
    visit project_url(project)
    click_link 'Edit Project'
    
    expect(current_path).to eq(edit_project_path(project))
    expect(find_field('Name').value).to eq(project.name)
    
    fill_in 'Name', with: 'Updated Project Name'
    
    click_button 'Update Project'
    
    expect(current_path).to eq(project_path(project))
    expect(page).to have_content('Updated Project Name')
  end
end