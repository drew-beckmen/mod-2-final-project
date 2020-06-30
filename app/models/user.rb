class User < ApplicationRecord
    has_many :goals
    has_many :activities, through: :goals
    has_many :activity_types, through: :activities
    has_many :memberships
    has_many :groups, through: :memberships

    validates :name, :username, :contact, :photo, :password, :password_confirmation, :presence => true 
    validates :username, :uniqueness => true 
    validates :contact, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, length: {minimum: 6}

    has_secure_password 
end
