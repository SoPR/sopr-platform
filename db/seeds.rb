# Seed data to populate users. Creates 30 Users with random data for a total of 2 pages of Users.
User.delete_all
random_bio_words = %w[node.js python ruby hackathon developer co-founder web open\ source security partner application]
roles = %w[Hacker Developer Designer Entrepreneur Artist Business]

# WARNING: This will open 30 tabs in your browser for User confirmation! Get ready.
30.times do |u|
  User.create(email: Faker::Internet.email,
              password: 'password',
              username: Faker::Internet.user_name,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              role: roles.sample,
              bio: random_bio_words.sample(10).join(' '),
              available_for_hire: [true, false].sample,
              github_username: Faker::Internet.user_name,
              dribbble_username: Faker::Internet.user_name,
              linkedin_username: Faker::Internet.user_name,
              flickr_username: Faker::Internet.user_name,
              facebook_username: Faker::Internet.user_name,
              twitter_username: Faker::Internet.user_name,
              website_url: Faker::Internet.url)
end