class StocksController < ApplicationController
   before_action :set_stock, only: [:show, :edit, :update, :destroy]
   before_action :require_user
   before_action :require_same_user, only: [:show, :edit, :update, :destory]
   
   def index
      @stock = Stock.new
      if params[:search]
         @stocks = current_user.stocks.search(params[:search]).paginate(page: params[:page], per_page: 20)
      else
         @stocks = current_user.stocks.paginate(page: params[:page], per_page: 20)
      end
      
   end
   
   def new
      @stock = Stock.new
   end
   
   def create
      @stock = Stock.new(stock_params)
      @stock.user = current_user
      if @stock.save 
         flash[:success] = 'Stock was successfully added'
         redirect_to stocks_path
      else
         @stocks = current_user.stocks.paginate(page: params[:page], per_page: 20)
         render 'index'
      end
   end
   
   
   def show

   end
   
   def edit

   end
   
   def update

      if @stock.update(stock_params)
         flash[:success] = 'Stock successfully updated'
         redirect_to stocks_path
      else
         render 'edit'
      end
   end
   
   def destroy
 
      @stock.destroy
      flash[:danger] = 'Stock successfully removed'
      redirect_to stocks_path
   end
   
   def import
      Stock.import(params[:file])
      redirect_to stocks_path
   end
   
   private
   def stock_params
      params.require(:stock).permit(:barcode, :name, :description, :quantity, :price)
   end
   
   def set_stock
       @stock = Stock.find(params[:id])
   end
   
   def require_same_user
     return if logged_in? && (current_user?(@stock.user) || current_user.admin?)
         flash[:danger] = "You can only edit or delete your own stocks"
         redirect_to root_path
      end
   
end