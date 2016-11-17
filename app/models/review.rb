class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  
  validates :user, :movie, :comment, presence: true  
  
end
