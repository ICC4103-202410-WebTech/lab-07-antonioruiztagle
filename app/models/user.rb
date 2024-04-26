class User < ApplicationRecord
    has_many :posts
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "debe ser un correo electrónico válido" }
    validates :password, presence: true, length: { minimum: 6, message: "debe tener al menos 6 caracteres" }
  end
  