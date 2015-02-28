require 'faker'


def seed_user(count)
  count.times {User.create(username: Faker::Name.name, email: Faker::Internet.email, password: 'twitty')}
end

def seed_tweets(count, id)
  count.times {Tweet.create(content: Faker::Lorem.words(4).join(" ") + "?", user_id: id)}
end

seed_user(10)
seed_tweets(5, 1)
seed_tweets(2, 2)
seed_tweets(7, 3)
seed_tweets(8, 4)

# def seed_all
#   seed_user(10)
#   User.all.each do |user|
#     seed_survey(2, user.id)
#     user.surveys.each do |survey|
#       seed_questions(3, survey.id)
#       survey.questions.each do |question|
#         seed_responses(5, question.id)
#       end
#     end
#   end
# end
