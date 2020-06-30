class GroupsController < ApplicationController
    before_action :current_group, only: [:edit, :update, :show, :destroy]

    def index
        @groups = Group.all
        @group = Group.new
    end
    
    def new
        @group = Group.new
        @user = current_user
    end

    def create
        @group = Group.new(group_params)
        if @group.valid?
            @group.save
            redirect_to group_path(@group)
        else
            flash[:messages] = @group.errors.full_messages
            redirect_to new_group_path
        end
    end

    def edit
        @user = current_user
    end

    def update
        @group.update(group_params)
        redirect_to group_path(@group)
    end

    def destroy
        @group.destroy
        redirect_to groups_path
    end

    def show
        @user = current_user
        @membership = @group.belong(@user) || Membership.new
    end 

    private

    def group_params
        params.require(:group).permit(:name, :description, :creator_id)
    end

    def current_group
        @group = Group.find(params[:id])
    end

end
