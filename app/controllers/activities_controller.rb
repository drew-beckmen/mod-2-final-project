class ActivitiesController < ApplicationController
    before_action :current_activity, only: [:edit, :update, :show, :destroy]
    before_action :redirect_unauthorized, only: [:show, :edit]
    skip_before_action :authenticated, only: [:new, :create]
    
    def index
        @user = current_user
        @activities = @user.activities
    end

    def show
    end
    
    def new
        @activity = Activity.new
        @user = current_user
        @activity_types = ActivityType.all
        @activity.build_activity_type
        @activity.build_goal
        @goals = current_user.goals
    end

    def create
        @activity = Activity.new(activity_params)
        if @activity.valid?
            @activity.save
            if a_new_goal?
                redirect_to activity_path(@activity)
            else
                redirect_to edit_goal_path(@activity.goal)
            end
        else
            flash[:errors] = @activity.errors.full_messages
            redirect_to new_activity_path
            # render 'show'
        end
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

    def redirect_unauthorized
        if !(@activity.goal.user == current_user)
            redirect_to activities_path
        end
    end

    def activity_params
        params.require(:activity).permit(:activity_type_id, :description, :goal_id, :activity_date, :duration, :rating, activity_type_attributes: [:name, :description, :creator_id], goal_attributes: [:name, :target_hours, :user_id, :start_day, :end_day])
    end

    def current_activity
        @activity = Activity.find(params[:id])
    end

    def a_new_goal?
        (!params[:activity][:goal_attributes]) || (!params[:activity][:goal_attributes][:name]) || params[:activity][:goal_attributes][:name].strip==""
    end
end
