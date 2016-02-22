class Task < ActiveRecord::Base
  belongs_to :project
  
  validates :name, presence: true
  validates :due_date, presence: true
end