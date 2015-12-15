class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :edit, :update, :destroy]
    before_action :require_user
    before_action :require_same_user, only: [:show, :edit, :update, :destory]
    
    def index
        @contact = Contact.new
        @contacts = current_user.contacts.paginate(page: params[:page], per_page: 20)
    end
    
    def show
    
    end
    
    def new
        @contact = Contact.new
    end
    
    def create
       @contact = Contact.new(contact_params)
       @contact.user = current_user
       if @contact.save
           flash[:success] = 'Contact successfully added'
           redirect_to contacts_path
       else
           render 'new'
        end
    end
    
    
    def destroy
        
    end
    
    private
    
    def contact_params
        params.require(:contact).permit(:name)
    end
    
    def set_contact
       @contact = Contact.find(params[:id]) 
    end
    
    def require_same_user
     return if logged_in? && (current_user?(@contact.user) || current_user.admin?)
         flash[:danger] = "You can only edit or delete your own stocks"
         redirect_to root_path
      end
   
    
end
