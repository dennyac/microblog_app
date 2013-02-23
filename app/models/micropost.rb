class Micropost < ActiveRecord::Base
  attr_accessible :content #, :user_id
  belongs_to :user

  default_scope order: 'microposts.created_at DESC'
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

    def self.from_users_followed_by(user)

   		followed_users = "select followed_id from relationships where follower_id = :user_id"
   		where("user_id in (#{followed_users}) or user_id = :user_id", user_id: user)

    end	

end
