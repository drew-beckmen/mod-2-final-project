class GroupActivityType < ApplicationRecord
    belongs_to :group
    belongs_to :activity_type
end
