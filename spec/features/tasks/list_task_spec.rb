require 'rails_helper'

RSpec.feature 'Showing a project task list' do
  scenario 'displays the tasks' do
    project = FactoryGirl.create(:project)
    task1 = project.tasks.create!(name: 'Task One', due_date: '2016-05-31')
    task2 = project.tasks.create!(name: 'Task two', due_date: '2016-06-15')
    
    visit project_tasks_path(project)
    
    expect(page).to have_content(task1.name)
    expect(page).to have_content(task2.name)
    expect(page).to have_content(task1.due_date)
    expect(page).to have_content(task2.due_date)
  end
end