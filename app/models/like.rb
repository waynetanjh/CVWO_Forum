class Like < ApplicationRecord 
    # rails generate migration CreateLikes user:references post:references
    belongs_to :user
    belongs_to :post

    # ensure user only can like the post once
    validates :user_id, uniqueness: {scope: :post_id}

end 