class ApplicationController < ActionController::Base

    helper_method :current_user , :logged_in?
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user #!! turns things into a boolean in ruby
    end

    def require_user
        if !logged_in?
         flash[:alert] = "You must be logged in to perform that action"
    end
end
