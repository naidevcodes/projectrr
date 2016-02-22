class Project < ActiveRecord::Base 
  has_many :tasks, dependent: :destroy  
  has_many :enablements
  has_many :resources, through: :enablements
  
  validates_presence_of :name
end