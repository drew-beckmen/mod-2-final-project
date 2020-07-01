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

end
