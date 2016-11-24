class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  
  has_many :voted_relationships, class_name:"Vote", foreign_key: "votable_id", dependent: :destroy
  has_many :voted_users, through: :voted_relationships, source: :voter
  
  validates :user, :movie, :comment, presence: true  
  
  delegate :username, to: :user, prefix: true 

end
