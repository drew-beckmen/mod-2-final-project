class MembershipsController < ApplicationController
    
    def create
        @membership=Membership.create(membership_params)
        redirect_to "/groups"
    end

    def index
        @memberships = Membership.select{|mem| mem.user == current_user }
        @user = current_user
    end
    private

    def membership_params
        params.require(:membership).permit(:group_id, :user_id)
    end

end
