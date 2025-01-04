class Posts < ApplicationRecord
    validates :content, length: {minimum: 2}
end