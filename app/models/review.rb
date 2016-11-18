class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  
  validates :user, :movie, :comment, presence: true  
  
  def user_username
    user.username
  end 
  
  delegate :username, to: :user, prefix: true 

end
