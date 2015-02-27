require 'faker'


def seed_user(count)
  count.times {User.create(username: Faker::Name.name, email: Faker::Internet.email, password: 'twitty')}
end

seed_user(10)
# def seed_tweets(count, id)
#   count.times {Question.create(title: Faker::Lorem.words(4).join(" ") + "?", survey_id: id)}
# end

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
