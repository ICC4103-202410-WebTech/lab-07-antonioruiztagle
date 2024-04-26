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


# Eliminar todos los registros existentes
Post.delete_all
User.delete_all
Tag.delete_all

# Crear usuarios
5.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = Faker::Internet.password(min_length: 6)
  User.create!(name: name, email: email, password: password)
end

# Crear etiquetas
5.times do
  name = Faker::Lorem.word.capitalize
  Tag.create!(name: name)
end

# Asignar usuarios y etiquetas a las publicaciones
User.all.each do |user|
  2.times do
    title = Faker::Lorem.sentence
    content = Faker::Lorem.paragraphs.join("\n")
    published_at = Faker::Time.between(from: 1.year.ago, to: DateTime.now)
    post = user.posts.create!(
      title: title,
      content: content,
      published_at: published_at
    )
    post.tags << Tag.all.sample(rand(1..3))
  end
end

  
