class GroupsController < ApplicationController
    before_action :current_group, only: [:edit, :update, :show, :destroy]

    def index
        @groups = Group.all
        @group = Group.new
        @top_matches = Group.interest_match(current_user)
        @rand_suggestion = (Group.all.reject{|grp| grp.belong?(current_user)} - @top_matches).sample(2)
    end
    
    def new
        @group = Group.new
        @user = current_user
        @activity_types = ActivityType.all
    end

    def create
        @group = Group.new(group_params)
        rej_params = params[:group][:activity_type_ids].reject{|aty| aty==""}
        @group.activity_types = rej_params.map{ |actp| ActivityType.find(actp) }
        if @group.valid?
            @group.save
            current_user.groups << @group
            redirect_to group_path(@group)
        else
            flash[:messages] = @group.errors.full_messages
            redirect_to new_group_path
        end
    end

    def edit
        @user = current_user
        @activity_types = ActivityType.all
    end

    def update
        @group.update(group_params)
        rej_params = params[:group][:activity_type_ids].reject{|aty| aty==""}
        @group.activity_types = rej_params.map{ |actp| ActivityType.find(actp) }
        if @group.valid?
            @group.save
            redirect_to group_path(@group)
        else
            flash[:messages] = @group.errors.full_messages
            redirect_to new_group_path
        end
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
        params.require(:group).permit(:name, :description, :creator_id, :img_url)
    end

    def current_group
        @group = Group.find(params[:id])
    end

end
