class User < ApplicationRecord
    has_many :posts
  
    validates :name, presence: { message: "no puede estar en blanco" }
    validates :email, presence: { message: "no puede estar en blanco" }, uniqueness: { message: "ya está en uso" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "debe ser un formato válido" }
    validates :password, presence: { message: "no puede estar en blanco" }, length: { minimum: 6, message: "debe tener al menos 6 caracteres" }
  end
  