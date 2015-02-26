class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets
  has_many :followerships, :foreign_key =>"user_id", :class_name => "Followership"
  has_many :followers, through: :followerships, :source => "follower"

  has_many :followeeships, :foreign_key =>"follower_id", :class_name => "Followership"
  has_many :followees, through: :followeeships, :source => "user"


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
