require 'rails_helper'

RSpec.feature 'Listing all projects', type: :feature do
  scenario 'returns a message when there are no projects to view' do
    visit '/'
    click_link 'Projects'
    
    expect(current_url).to eq(projects_url)
    expect(page).to have_content('0 projects')
  end
  
  scenario 'displays the projects' do
    project1 = Project.create!(name: 'Test Project', description: 'Testing Purposes',       # Use the bang `!` so errors bubble up
      start_date: '2015-01-15', projected_end_date: '2015-12-31', 
      actual_end_date: '2016-01-15', budget: 1000.00, cost: 2000.00)
    project2 = Project.create!(name: 'Test Project A', description: 'Testing Purposes', 
      start_date: '2015-01-15', projected_end_date: '2015-12-31', 
      actual_end_date: '2016-01-15', budget: 1000.00, cost: 2000.00)
    project3 = Project.create!(name: 'Test Project B', description: 'Testing Purposes', 
      start_date: '2015-01-15', projected_end_date: '2015-12-31', 
      actual_end_date: '2016-01-15', budget: 1000.00, cost: 2000.00)
      
      visit '/'
      click_link 'Projects'
      
      expect(current_url).to eq(projects_url)
      expect(page).to have_content('3 projects')
      expect(page).to hve_content(project1.name)
      expect(page).to have_content(project1.description)
      expect(page).to have_content(project1.start_date)
      expect(page).to have_content(project1.projected_end_date)
      expect(page).to have_content(project1.actual_end_date)
      expect(page).to have_content(project1.budget)
      expect(page).to have_content(project1.cost)
  end
end