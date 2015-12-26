class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :edit, :update, :destroy]
    before_action :require_user
    before_action :require_same_user, only: [:show, :edit, :update, :destory]
    
    def index
        @contact = Contact.new
        if params[:search]
            @contacts = current_user.contacts.search(params[:search]).paginate(page: params[:page], per_page: 20)
        else
            @contacts = current_user.contacts.paginate(page: params[:page], per_page: 20)
        end
    end
    
    def show
        if @contact.patch_test
            patch_test_test
        end
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
           @contact.patch_test = false
           @contact.patch_test_time = ''
           render 'new'
        end
    end
    
    
    def destroy
        @contact.destroy
        flash[:danger] = 'Contact successfully removed'
        redirect_to contacts_path
    end
    
    private
    
    def contact_params
        params.require(:contact).permit(:name, :mobile_phone, :home_phone, :patch_test, :patch_test_time)
    end
    
    def set_contact
       @contact = Contact.find(params[:id]) 
    end
    
    def require_same_user
     return if logged_in? && (current_user?(@contact.user) || current_user.admin?)
         flash[:danger] = "You can only edit or delete your own stocks"
         redirect_to root_path
    end
   
    def patch_test_test
        time_now = Time.now.to_formatted_s(:db).to_time.to_i
        time_db = @contact.patch_test_time.to_time.to_i
        difference = time_now - time_db
        mm, ss = difference.divmod(60)
        hh, mm = mm.divmod(60)
        dd, hh = hh.divmod(24)
        mon, dd = dd.divmod(30)
        year, mon = mon.divmod(12)
        if year > 0
            @set_timer = "(#{year} years ago)"
        elsif mon > 0
            @set_tier = "(#{mon} months ago)"
        elsif dd > 0
            @set_timer = "(#{dd} days ago)"
        elsif hh > 0
            @set_timer = "(#{hh} hours ago)"
        elsif mm > 0
            @set_timer = "(#{mm} minutes ago)"
        else
            @set_timer = ''
        end
            
        if difference > 172800
            @difference_test = true
        else
            @difference_test = false
        end
    end
    
end
