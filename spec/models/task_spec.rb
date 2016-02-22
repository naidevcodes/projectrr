require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'belongs to a project' do
    project = FactoryGirl.create(:project)
    task = project.tasks.build(name: 'Test Task', due_date: '2/2/16')
    
    expect(task.project).to eq(project)
  end
end