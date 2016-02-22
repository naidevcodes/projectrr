require 'rails_helper'

RSpec.feature 'Editing a task' do
  scenario 'saves the updated task with valid values' do
    project = FactoryGirl.create(:project)
    task = project.tasks.create!(name: 'Task One', due_date: '2016-06-15')
    
    visit project_path(project)
    click_link 'Edit Task'
    
    fill_in 'task_name', with: 'Updated Name'
    click_button 'Update Task'
    
    expect(current_path).to eq(project_tasks_path(project))
    expect(page).to have_content('Updated Name')
  end
  
  scenario 'fails with a blank name' do
    project = FactoryGirl.create(:project)
    task = project.tasks.create!(name: 'Task One', due_date: '2016-5-5')
    
    visit project_path(project)
    
    click_link 'Edit Task'
    
    fill_in 'task_name', with: ''
    click_button 'Update Task'
    
    expect(current_path).to eq(project_task_path(project, task))
    expect(page).to have_content('error')
  end
  
  scenario 'fails with blank due date' do
    project = FactoryGirl.create(:project)
    task = project.tasks.create!(name: 'Task One', due_date: '2016-6-6')
    
    visit project_path(project)
    
    click_link 'Edit Task'
    
    fill_in 'task_due_date', with: ''
    click_button 'Update Task'
    
    expect(current_path).to eq(project_task_path(project, task))
    expect(page).to have_content('error')
  end 
end