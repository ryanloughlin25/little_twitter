class CreateFollowerships < ActiveRecord::Migration
  def change
    create_table :followerships do |t|
      t.references :user, index: true
      t.references :follower, index: true
      t.timestamps
    end
  end
end
