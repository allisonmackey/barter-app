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

  scope :newest_oldest, -> {( order(created_at: :desc))}
  scope :oldest_newest, -> {( order(created_at: :asc))}
end