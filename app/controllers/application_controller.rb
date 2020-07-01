class ApplicationController < ActionController::Base
    # before_action :authenticated

    def current_user
        if session[:user_id]
            current_user = User.find(session[:user_id])
        end 
    end 

    # Double bang to go from instance to true value
    def logged_in?
        !!current_user
    end 

    def authenticated 
        redirect_to "/" unless logged_in?
    end 

end
