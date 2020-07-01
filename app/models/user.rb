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

    def formatted_activities 
        format_activities = {}
        self.activities.each do |activity|
            if format_activities[activity.activity_type.name].nil?
                format_activities[activity.activity_type.name] = 1 
            else 
                format_activities[activity.activity_type.name] += 1
            end 
        end 
        format_activities
    end 

    def formatted_goals 
        format_goals = {}
        self.goals.each do |goal|
            format_goals[goal.name] = goal.progress 
        end 
        format_goals 
    end 

    def goals_end_this_month 
        self.goals.select {|goal| goal.end_day.month == Date.today.month && goal.progress < 100 && goal.end_day.year == Date.today.year }
    end 

    def goals_end_this_week
        self.goals_end_this_month.select {|goal| goal.end_day.cweek == Date.today.cweek && goal.progress < 100 }
    end 

    def completed_goals 
        self.goals.select {|goal| goal.progress >= 100 }
    end
    
    # Returns the three most pressing goals that are coming up
    def most_urgent_goals 
        sorted_goals = self.goals.sort_by {|goal| goal.end_day }
        sorted_goals = sorted_goals.select {|goal| goal.end_day > Date.today}
        sorted_goals.select {|goal| goal.progress < 100 }.first(3)
    end 

    # Returns has with date as key and num activities on that date as 
    # value within the timeframe specific by the parameter
    def activity_by_time(time)
        hash_of_activities = {}
        self.activities.each do |activity| 
            if activity.activity_date >= Date.today - time && activity.activity_date <= Date.today 
                if hash_of_activities[activity.activity_date.to_s].nil?
                    hash_of_activities[activity.activity_date.to_s] = 1
                else 
                    hash_of_activities[activity.activity_date.to_s] += 1
                end 
            end 
        end
        hash_of_activities  
    end     

    def streak_this_week?
        activity_by_time(7).size == 7
    end 

    def streak_this_month?
        activity_by_time(30).size == 30
    end

    def streak_today?
        activity_by_time(0).size == 1 
    end 

    def has_streak? 
        streak_this_week? || streak_this_month? || streak_today?
    end 

end
