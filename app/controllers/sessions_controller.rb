class SessionsController < ApplicationController 
    skip_before_action :authenticated, only: [:new, :create, :welcome]
    def new
        if session[:user_id]
            redirect_to "/home/#{session[:user_id]}"
        end 
    end 
    
    def create 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to "/home/#{@user.id}"
        else 
            flash[:message] = "Incorrect email or password"
            redirect_to "/"
        end 
    end 

    def welcome  
    end 

    def destroy 
        session.delete(:user_id)
        redirect_to "/"
    end 
end 