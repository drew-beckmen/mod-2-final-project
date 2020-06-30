class UsersController < ApplicationController

    before_action :find_user, only: [:home, :edit, :update, :show]
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
    before_action :protect_pages, only: [:home, :edit, :destroy]
    def new 
        @user = User.new 
    end 

    def create 
        new_user = User.new(user_params)
        if params[:user][:password] != params[:user][:password_confirmation]
            flash[:password_mismatch] = "Password confirmation did not match."
            redirect_to '/users/new'
        elsif !new_user.valid?
            flash[:errors] = new_user.errors.full_messages
            redirect_to '/users/new'
        else 
            new_user.save 
            session[:user_id] = new_user.id 
            redirect_to "/home/#{new_user.id}"
        end  
    end 

    def home 
    end 

    def edit 
    end 

    def show 
    end 

    def update
        @user.attributes = user_params 
        if @user.valid? 
            @user.save 
            redirect_to "/home/#{@user.id}"
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{@user.id}/edit"
        end 
    end 

    def destroy
        User.delete(params[:id])
        redirect_to '/'
    end 

    private 
    def user_params 
        params.require(:user).permit(:username, :password, :password_confirmation, :name, :contact, :photo)
    end 

    def find_user 
        @user = User.find(params[:id])
    end 

    def require_login 
        return head(:forbidden) unless session.include? :user_id 
    end

    def protect_pages 
        if session[:user_id] != params[:id].to_i
            redirect_to "/home/#{session[:user_id]}"
        end 
    end 
end
