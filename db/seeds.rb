require 'faker'

type = ['Comment', 'Post']

10.times{User.create!(username: Faker::Pokemon.name, password: 'password')}

20.times{Post.create!(title: Faker::Hipster.sentence(4), body: Faker::StarWars.quote, user_id: (rand(9) + 1))}

20.times{Comment.create!(body: Faker::Beer.name, user_id: (rand(9) + 1), post_id: (rand(19) + 1) )}

25.times{Vote.create!(voteable_type: type.sample, voteable_id: (rand(19) + 1))}
