class Goal < ApplicationRecord
    belongs_to :user
    has_many :activities
    has_many :activity_types, through: :activities

    validates :target_hours, :start_day, :end_day, presence: true 
    validates :target_hours, numericality: {greater_than: 0}

    def hours_so_far
        self.activities.sum(&:duration)
    end 

    def progress 
        (self.hours_so_far / self.target_hours).round(3) * 100
    end 
end
