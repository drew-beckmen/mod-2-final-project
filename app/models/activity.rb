class Activity < ApplicationRecord
    belongs_to :activity_type
    belongs_to :goal
    accepts_nested_attributes_for :activity_type, :goal
    # validates :activity_type_id, presence: true  ##  Needs special validator
    validates :duration, presence: true
    validates :activity_date, presence: true
    #validates :activity_date, numericality: {if: Proc.new{byebug}, message: "- You can't log an activity for a future date!"}
    validate :not_future_date
    validate :within_goal_dates
    validates :rating, presence: true 
    validates :rating, numericality: {less_than: 11, greater_than: 0}
    # validates_with GoalValidator ## Will check for presence of either goal_id or nested params for goal association
    
    def not_future_date 
        byebug
        errors.add(:base, "You can't log an activity for a future date!") unless self.activity_date <= Date.today
    end

    def within_goal_dates
        errors.add(:base, "That's not within the date range of your goal!") unless (self.activity_date <= self.goal.end_day && self.activity_date >= self.goal.start_day)
    end
    
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

    def today_plus_one
        byebug
        Date.today+1
    end

end
