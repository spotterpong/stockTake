class AdminController < ApplicationController
    before_filter :authorised?
    
    private
    def authorised?
        if logged_in?
            unless current_user.admin?
                flash[:danger] = "You are not authorized to view that page."
                redirect_to root_path
            end
        else
                flash[:danger] = "Please log in."
                redirect_to root_path 
        end
    end
    
end