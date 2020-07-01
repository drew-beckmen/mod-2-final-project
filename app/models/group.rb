class Group < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :group_activity_types
    has_many :activity_types, through: :group_activity_types
    validates :name, presence: true
    validates :name, uniqueness: true

    def belong?(user)
        !!belong(user)
    end
    
    def belong(user)
        Membership.find_by(group_id: self.id, user_id: user.id)
    end

    def is_creator?(user)
        self.creator_id == user.id
    end
end
