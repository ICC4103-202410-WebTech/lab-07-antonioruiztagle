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

# Crear usuarios
5.times do |n|
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6)
  )
end

# Crear usuario "John Doe"
john_doe = User.create!(name: "John Doe", email: "john.doe@example.com", password: "password")

post1 = Post.create!(
  title: "Publicación 1",
  content: "Este es el contenido de la Publicación 1",
  user_id: john_doe.id, # Asigna el ID del usuario "John Doe" como autor de la publicación
  answers_count: 0, # Puedes establecer el contador de respuestas a 0 si es necesario
  likes_count: 0, # Puedes establecer el contador de likes a 0 si es necesario
  published_at: Time.current, # Establece la fecha y hora de publicación como la actual
  tags: Tag.all.sample(rand(1..3)) # Asigna un conjunto aleatorio de etiquetas
)

# Crear etiquetas
10.times do
  Tag.create!(name: Faker::Lorem.unique.word)
end

# Crear publicaciones asociadas a los usuarios y etiquetas
User.all.each do |user|
  rand(1..3).times do
    post = user.posts.create!(
      title: Faker::Lorem.unique.sentence,
      content: Faker::Lorem.paragraph,
      tags: Tag.all.sample(rand(1..3))
    )
  end
end



