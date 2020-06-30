class Group < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
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
