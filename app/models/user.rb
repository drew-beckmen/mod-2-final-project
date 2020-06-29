class User < ApplicationRecord
    has_many :goals
    has_many :activities, through: :goals
    has_many :activity_types, through: :activities
    has_many :memberships
    has_many :groups, through: :memberships
end
