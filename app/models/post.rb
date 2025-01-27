class Post < ApplicationRecord
    validates :content, length: {minimum: 2}

    belongs_to :user
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
end