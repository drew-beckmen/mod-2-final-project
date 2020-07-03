class Group < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :group_activity_types
    has_many :activity_types, through: :group_activity_types
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :img_url, presence: true 

    def belong?(user)
        !!belong(user)
    end
    
    def belong(user)
        Membership.find_by(group_id: self.id, user_id: user.id)
    end

    def is_creator?(user)
        # byebug
        self.creator_id == user.id
    end

    def self.interest_match(user, num=3)
        # self.all.sort_by{ |grp| grp.num_in_common(user) }.reject{|grp| grp.belong?(user)}.reverse.first(num)
        # self.all.sort_by { |grp| grp.jaccard(user) }.reverse.first(num)
        self.all.reject {|grp| user.groups.include?(grp)}.sort_by { |grp| grp.jaccard(user) }.reverse.first(num)
    end

    # we use the jaccard similarity index to find groups that our users might want to join
    def jaccard(user)
        n = self.activity_types.select{|acti| user.activity_types.include?(acti)}.count.to_f
        d = self.activity_types.count + user.activity_types.count - n
        d > 0 ? n/d : 0
    end


    def num_in_common(user)
        self.activity_types.reduce(0){|sum, acti| user.activity_types.include?(acti) ? sum + 1 : sum }
    end

    def self.calculation(num_user, num_group, num_match)
        # first check nothing is zero
        (num_user.to_f/num_group) * num_match
    end
end
