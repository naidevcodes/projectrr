require 'rails_helper'

RSpec.describe Resource, type: :model do
  before(:all) do
    @resource = FactoryGirl.build(:resource)
  end
  
  it 'has a valid factory' do
    expect(@resource).to be_valid
  end
  
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:description) }
  
   it { is_expected.to have_many(:assignments) }
   it { is_expected.to have_many(:projects) }
  
  it { is_expected.to validate_presence_of(:name) }
end