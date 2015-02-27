class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets
  has_many :follower_relationships, :foreign_key =>"followed_id", :class_name => "Followership"
  has_many :followers, through: :follower_relationships, :source => "follower"

  has_many :followed_relationships, :foreign_key =>"follower_id", :class_name => "Followership"
  has_many :followings, through: :followed_relationships, :source => "followed"


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
