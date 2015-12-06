class UsersController < ApplicationController
   def index
   end
   
   def new
       @user = User.new
   end
   
   def create
       @user = User.new(user_params)
       if @user.save
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
   end
    
    private
    def user_params
       params.require(:user).permit(:username, :email, :password) 
    end
end