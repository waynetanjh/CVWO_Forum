class User < ApplicationRecord 
    # ensure email is lowercase before saved to database 
    before_save { self.email = email.downcase }
    validates :name, presence:true,
               uniqueness: { case_sensitive: false }, 
               length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    # validates the email inputted, 2 people cannot have same email
    validates :email, presence: true, length: { maximum: 105 },
                uniqueness: { case_sensitive: false },
                format: { with: VALID_EMAIL_REGEX }
    has_secure_password

    validates :password, presence: true, length: { minimum: 6 }

    has_many :posts
    has_many :likes
    has_many :liked_posts, through: :likes, source: :post
    
    has_many :follows_as_follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
    has_many :following, through: :follows_as_follower, source: :following

    # Users following the user
    has_many :follows_as_following, class_name: "Follow", foreign_key: "following_id", dependent: :destroy
    has_many :followers, through: :follows_as_following, source: :follower
end 