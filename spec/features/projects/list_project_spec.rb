require 'rails_helper'

RSpec.feature 'Listing all projects', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
   
  scenario 'returns a message when there are no projects to view' do
    Project.destroy_all
    
    visit '/'
    click_link 'Projects'
    
    expect(current_url).to eq(projects_url)
    expect(page).to have_content('0 projects')
  end
  
  context 'when projects exist' do
    before(:all) do
      Project.destroy_all
      @project1 = FactoryGirl.create(:project)
      @project2 = FactoryGirl.create(:project)
      @project3 = FactoryGirl.create(:project)
    end
  end
  
  scenario 'displays the projects' do
    
      
      visit '/'
      click_link 'Projects'
      
      expect(current_url).to eq(projects_url)
      expect(page).to have_content('3 projects')
      expect(page).to have_content(project1.name)
      expect(page).to have_content(project1.description)
      expect(page).to have_content(project1.start_date)
      expect(page).to have_content(project1.projected_end_date)
      expect(page).to have_content(project1.actual_end_date)
      expect(page).to have_content(project1.budget)
      expect(page).to have_content(project1.cost)
  end
end