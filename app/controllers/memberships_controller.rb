class MembershipsController < ApplicationController
    
    def create
        @membership=Membership.create(membership_params)
    end

    private

    def membership_params
        params.require(:membership).permit(:group_id, :user_id)
    end

end
