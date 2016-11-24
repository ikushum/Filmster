class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :username, presence: true       
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :reviews
  
  has_many :following_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  has_many :followed_users, through: :followed_relationships, source: :follower
 
  has_many :voting_relationships, class_name: "Vote", foreign_key: "voter_id", dependent: :destroy
  has_many :voting_reviews, through: :voting_relationships, source: :votable

  def reviewed?(movie)
    return true if reviews.exists?(movie_id: movie.id)
  end 
  
  def follow(other_user)  
    following_relationships.create(followed_id: other_user.id)
  end
  
  def vote(review)
    voting_relationships.create(votable_id: review.id)
  end 
  
  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?(user)
     return true if following_relationships.exists?(followed_id: user.id)
  end 

end
