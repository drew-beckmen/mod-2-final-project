class GoalsController < ApplicationController
    before_action :find_goal, only: [:show, :edit, :update]
    
    def new 
        @goal = Goal.new 
    end 

    def create 
        new_goal = Goal.new(goal_params)
        new_goal.user_id = session[:user_id]
        if !new_goal.valid?
            flash[:errors] = new_goal.errors.full_messages
            redirect_to "/goals/new"
        else 
            new_goal.save 
            redirect_to "/goals"
        end 
    end 

    def edit 
    end 

    def update 
        @goal.attributes = goal_params
        if @goal.valid? 
            @goal.save 
            redirect_to "/goals"
        else 
            flash[:errors] = @goal.errors.full_messages
            redirect_to "/goals/#{@goal.id}/edit"
        end 
    end 

    def show 
    end 

    def index 
        @user = current_user 
    end 

    def destroy
        Goal.find(params[:id]).destroy 
        redirect_to "/goals"
    end 

    private 
    def find_goal
        @goal = Goal.find(params[:id])
    end 

    def goal_params
        params.require(:goal).permit(:target_hours, "start_day(1i)", "start_day(2i)", "start_day(3i)", "end_day(1i)", "end_day(2i)", "end_day(3i)", :name, :description)
    end 
end
