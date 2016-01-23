class Admin::UsersController < AdminController
   
   def index
      @Users = User.all  
   end
   
   
    
end