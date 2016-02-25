require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:all) do
    @project1 = FactoryGirl.build(:project)
  end
  
  it 'has a valid factory' do
    expect(@project1).to be_valid
  end
  
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:description) }
  it { is_expected.to have_db_column(:start_date) }  
  it { is_expected.to have_db_column(:projected_end_date) }
  it { is_expected.to have_db_column(:actual_end_date) }
  it { is_expected.to have_db_column(:budget) }
  it { is_expected.to have_db_column(:cost) }
  
  it { is_expected.to validate_presence_of(:name) }
  
  it { is_expected.to have_many(:assignments) }
  it { is_expected.to have_many(:resources) }
end