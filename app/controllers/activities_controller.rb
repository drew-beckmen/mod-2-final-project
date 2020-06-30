class ActivitiesController < ApplicationController
    
    before_action :current_activity, only: [:edit, :update, :show, :destroy]

    def index
        @user = current_user
        @activities = Activity.select { |activity| activity.goal.user == current_user }
    end
    
    def new
        @activity = Activity.new
        @user = current_user
        @activity_types = ActivityType.all
        @goals = current_user.goals
    end

    def create
        @activity = Activity.create(activity_params)
        redirect_to activity_path(@activity)
    end

    def edit
        @user = current_user
        @activity_types = ActivityType.all
        @goals = current_user.goals
    end

    def update
        @activity.update(activity_params)
        redirect_to activity_path(@activity)
    end

    def destroy
        @activity.destroy
        redirect_to activities_path
    end

    private

    def activity_params
        params.require(:activity).permit(:activity_type_id, :description, :goal_id, :activity_date, :duration, :rating)
    end

    def current_activity
        @activity = Activity.find(params[:id])
    end

end
