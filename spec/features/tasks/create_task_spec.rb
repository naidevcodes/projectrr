require 'rails_helper'

RSpec.feature 'Creating a task', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  scenario 'saves the task if it is valid' do
    project = FactoryGirl.create(:project)
    
    visit project_url(project)
    click_link 'Add Task'
    
    expect(current_path).to eq(new_project_task_path(project))
    
    fill_in 'Name', with: 'Test task one'
    fill_in 'Due date', with: '2/2/16'
    click_button 'Create Task'
        
    expect(current_path).to eq(project_task_path(project, Task.last))
    expect(page).to have_content('Test task one')
    expect(page).to have_content(Task.last.due_date)
  end
end