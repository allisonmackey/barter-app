# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Post.destroy_all
Comment.destroy_all

@all_users = User.all
@all_posts = Post.all

15.times do 
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: Faker::Internet.password, 
    zipcode: Faker::Number.number(digits: 5) 
  )
end


@all_users.each do |user| 
  rand(2..5).times do
    user.posts.create!(
      title: Faker::Book.title,
      body: Faker::Lorem.paragraph_by_chars(number: 55, supplemental: false),
      author: "#{user.username}",
      icon: "", 
      offer: Faker::TvShows::HowIMetYourMother.catch_phrase, 
      offer_type: "services",
      zipcode: "#{user.zipcode}", 
    )
  end
  rand(2..5).times do
    user.posts.create!(
      title: Faker::Book.title,
      body: Faker::Lorem.paragraph_by_chars(number: 55, supplemental: false),
      author: "#{user.username}",
      icon: "", 
      offer: Faker::TvShows::HowIMetYourMother.catch_phrase, 
      offer_type: "goods",
      zipcode: "#{user.zipcode}", 
    )
  end
end

@all_posts.each do |post| 
  rand(2..5).times do
    post.comments.create!(
      author: "#{post.author}", 
      body: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false), 
      offer: Faker::Book.genre , 
      offer_type: "goods" ,
    )
  end
  rand(2..5).times do
    post.comments.create!(
      author: "#{post.author}", 
      body:  Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false), 
      offer: Faker::Book.genre, 
      offer_type: "services" ,
    )
  end
end



p "Created #{User.count} users, #{Post.count} posts, #{Comment.count} comments "
