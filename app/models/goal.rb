class Goal < ApplicationRecord
    belongs_to :user
    has_many :activities
    has_many :activity_types, through: :activities
end
