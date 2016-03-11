require 'rails_helper'

RSpec.feature 'Viewing a project', type: :feature do
   before do
     @user = FactoryGirl.create(:user)
     sign_in(@user)
   end
   
  scenario 'shows the project details' do
    project = FactoryGirl.create(:project)
    
    visit project_url(project)
    
    expect(page).to have_content(project.name)
    expect(page).to have_content(project.description)
    expect(page).to have_content(project.start_date)
    expect(page).to have_content(project.projected_end_date)
    expect(page).to have_content(project.actual_end_date)
    expect(page).to have_content(project.budget)
    expect(page).to have_content(project.cost)
    
  end
  
  context 'with related data' do
    before(:all) do
      @project1 = FactoryGirl.create(:project)
    end
    
    scenario 'shows the project tasks' do
      task1 = @project1.tasks.create(name: 'Task one', due_date: '2016-5-5')
      task2 = @project1.tasks.create(name: 'Task two', due_date: '2016-5-5')
      task3 = @project1.tasks.create(name: 'Task three', due_date: '2016-5-5')
      
      visit project_url(@project1)
      
      expect(page).to have_content('Task one')
      expect(page).to have_content('Task two')
      expect(page).to have_content('Task three')
      
    end
    
    scenario 'shows the project assignment' do
      resource1 = FactoryGirl.create(:resource)
      resource2 = FactoryGirl.create(:resource)
      resource3 = FactoryGirl.create(:resource)
      
      assignment1 = Assignment.create(project: @project1, resource: resource1)
      assignment2 = Assignment.create(project: @project1, resource: resource2)
      assignment3 = Assignment.create(project: @project1, resource: resource3)
    
      visit project_url(@project1)
      
      expect(page).to have_content(resource1.name)
      expect(page).to have_content(resource2.name)
      expect(page).to have_content(resource3.name)
    end
  end
end