class Followership < ActiveRecord::Base
  belongs_to :user, :foreign_key =>"user_id", :class_name =>"User"
  belongs_to :foller, :foreign_key =>"follwer_id", :class_name =>"User"

end
