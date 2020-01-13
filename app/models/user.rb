class User < ApplicationRecord
    validates :username, presence:true, uniqueness:true,length:{maximum: 30}
    validates :email, presence:true, uniqueness:true,length:{maximum: 30}
    before_validation {email.downcase!}
    has_secure_password
    validates :password, :password_confirmation, presence:true, length: {minimum: 6}
    has_many :posts
end
