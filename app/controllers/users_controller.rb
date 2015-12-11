class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_admin, only: [:destroy]
    
   def index
   end
   
   def new
       @user = User.new
   end
   
   def create
       @user = User.new(user_params)
       if @user.save
           session[:user_id] = @user.id
           flash[:success] = "Welcome, account successfully created"
           redirect_to stocks_path
       else
           render 'new'
       end
   end
   
   def edit  
   end
   
   def update
   end
   
   def destroy
       @user.destory
       flast[:danger] = "User and all data created successfully removed"
       redirect_to users_path
   end
    
    private
    def user_params
       params.require(:user).permit(:username, :email, :password) 
    end
    
    def set_user
       @user = User.find(params[:id])  
    end
    
   def require_same_user
    return if logged_in? && (current_user?(@user) || current_user.admin?)
         flash[:danger] = "You can only edit your own profile"
         redirect_to root_path
    end
   
   
   def require_admin
      return if logged_in? && !current_user.admin?
          flash[:danger] = "Only admin users can preform that task"
          redirect_to root_path
      end
  
end