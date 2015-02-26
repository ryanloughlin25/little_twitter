class Followership < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, :foreign_key =>"follower_id", :class_name =>"User"
end
