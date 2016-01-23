class AdminController < ApplicationController
    before_filter :authorised?
    
    private
    def authorised?
        unless current_user.admin?
            flash[:danger] = "You are not authorized to view that page."
            redirect_to root_path
        end
    end
    
end