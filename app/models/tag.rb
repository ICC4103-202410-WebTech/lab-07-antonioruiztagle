class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags
  
    validates :name, presence: { message: "no puede estar en blanco" }, uniqueness: { message: "ya está en uso" }
  end
  