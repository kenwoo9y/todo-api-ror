class User < ApplicationRecord
    has_secure_password

    VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
    
    validates :user_name, presence: true, uniqueness: true, length: { maximum: 30, allow_blank: true }
    validates :email, presence: true, uniqueness: true, length: { maximum: 80, allow_blank: true }
    validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
end
