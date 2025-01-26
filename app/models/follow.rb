class Follow < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :following, class_name: "User"

    # Add validations if necessary
    validates :follower_id, uniqueness: { scope: :following_id }

end
