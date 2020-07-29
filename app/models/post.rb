class Post < ApplicationRecord 
  belongs_to :user
  has_many :comments, dependent: :destroy

  pg_search_scope :search_posts, against: [:title, :author, :offer, :offer_type, :body], 
  using: {
    tsearch: {
      any_word: true, 
      prefix: true
    }
  }

end