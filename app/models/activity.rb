class Activity < ApplicationRecord
    belongs_to :activity_type
    belongs_to :goal
    accepts_nested_attributes_for :activity_type
    # validates :activity_type_id, presence: true  ##  Needs special validator
    validates :duration, presence: true
    validates :activity_date, presence: true
    # validates_with GoalValidator ## Will check for presence of either goal_id or nested params for goal association
end
