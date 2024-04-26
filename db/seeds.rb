# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

# Limpiar la base de datos antes de poblarla
User.delete_all
Post.delete_all
Tag.delete_all
PostTag.delete_all

john_doe = User.create!(name: "John Doe", email: "john.doe@gmail.com", password: "password")
5.times do |n|
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6)
  )
end
 
tag_1 = Tag.create(name: "Tag1")
10.times do
  Tag.create!(name: Faker::Lorem.unique.word)
end


5.times do |n|
    user = User.offset(rand(User.count)).first
    post = user.posts.create!(title: "Post #{n+1}",
    content: Faker::Lorem.paragraph)
    post.tags << tag_1

end

Post.all.each do |post|
  post.tags << Tag.offset(rand(Tag.count)).first unless post.tags.include?(tag_1)
end






