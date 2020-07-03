class Goal < ApplicationRecord
    belongs_to :user
    has_many :activities
    has_many :activity_types, through: :activities
    validates :name, presence: true 
    validates :target_hours, :start_day, :end_day, presence: true 
    validates :target_hours, numericality: {greater_than: 0}
    validate :dates_proper_order

    def hours_so_far
        self.activities.sum(&:duration)
    end

    def dates_proper_order
        errors.add(:base, "Your start day can't be after your end day!") unless self.start_day <= self.end_day
    end

    def progress 
        (self.hours_so_far / self.target_hours).round(3) * 100
    end
    
    def progress_for_pie_chart 
        percentage_complete = self.progress 
        percentage_incomplete = (100 - percentage_complete) if percentage_complete <= 100
        {Complete: percentage_complete, Incomplete: percentage_incomplete}
    end 

    def status 
        if self.progress >= 100 
            "Goal complete! ✔️"
        elsif self.progress <= 100 && self.end_day < Date.today
            "Goal expired without completion 🛑"
        else 
            "Goal incomplete. Keep working! 👏"
        end 
    end 
end
