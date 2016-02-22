require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) do
  @project1 = Project.new(name: 'Test Project', description: 'Testing Purposes',
      start_date: '2015-01-15', projected_end_date: '2015-12-31', 
      actual_end_date: '2016-01-15', budget: 1000.00, cost: 2000.00)
  end
  
  it 'should have a name field' do
    expect(project1.name).to eq('Test Project')
  end
  it 'should have a decription field' do
    expect(project1.description).to eq('Testing Purposes')
  end
  it 'should have a start_date field' do
    expect(project1.start_date).to eq('2015-01-15')
  end
  it 'should have a projected_end_date field' do
    expect(project1.projected_end_date).to eq('2015-12-31')
  end
  it 'should have an actual_end_date field' do
    expect(project1.actual_end_date).to eq('2016-1-15')
  end
  it 'should have a budget field' do
    expect(project1.budget).to eq(1000.00)
  end
  it 'should have a cost field' do
    expect(project1.description).to eq(2000.00)
  end
end

  #rails GENERATE migration create_projects name description:text 
  #start_date:datetime projected_end_date:datetime actual_end_date:end_date
  #budget:float cost:float
  
  # then RAKE DB:MIGRATE




