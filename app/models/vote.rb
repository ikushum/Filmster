class Vote < ActiveRecord::Base
    belongs_to :voter, class_name: "User"
    belongs_to :votable, class_name: "Review"
    validates :voter, :votable, presence: true
    validates :votable_id, uniqueness: {scope: :voter_id}
end
