class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user, index: true
      t.string  :content
      t.timestamps
    end
  end
end
