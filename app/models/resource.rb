class Resource < ActiveRecord::Base
  has_many :assignments
  has_many :projects, through: :assignments
  
  validates :name, presence: true
end