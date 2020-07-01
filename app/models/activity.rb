class Activity < ApplicationRecord
    belongs_to :activity_type
    belongs_to :goal
    accepts_nested_attributes_for :activity_type, :goal
    # validates :activity_type_id, presence: true  ##  Needs special validator
    validates :duration, presence: true
    validates :activity_date, presence: true
    # validates_with GoalValidator ## Will check for presence of either goal_id or nested params for goal association

    def activity_type_attributes=(atr)
        unless (!atr[:name]) || atr[:name].strip==""
            at = ActivityType.find_or_create_by(name: atr[:name])
            at.update(atr)
            self.activity_type=at
        end
    end

    def goal_attributes=(atr)
        unless (!atr[:name]) || atr[:name].strip==""
            self.goal = Goal.create(atr)
        end
    end

end
