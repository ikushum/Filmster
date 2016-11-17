class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :username, presence: true       
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :reviews
  
  def reviewed?(movie)
      reviewed=false
      movie.reviews.each do |review|
        reviewed=true if username==review.user.username
      end 
      return reviewed
  end 

end
