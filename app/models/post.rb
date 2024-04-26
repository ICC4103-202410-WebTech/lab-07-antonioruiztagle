class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags
  
    validates :title, presence: { message: "no puede estar en blanco" }
    validates :content, presence: { message: "no puede estar en blanco" }
    validates :user_id, presence: { message: "debe estar presente" }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "debe ser igual o mayor que 0" }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "debe ser igual o mayor que 0" }
    before_validation :set_published_at
  
    private
  
    def set_published_at
      self.published_at ||= Time.current
    end
  end
  