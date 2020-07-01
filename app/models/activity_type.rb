class ActivityType < ApplicationRecord
    has_many :activities
    has_many :group_activity_types
    has_many :groups, through: :group_activity_types
end
