class StocksController < ApplicationController
   
   def index
      @stocks = Stock.all
   end
   
   def new
      @stock = Stock.new
   end
   
   def create
      @stock = Stock.new(stock_params)
      if @stock.save 
         flash[:notice] = 'Stock was successfully added'
         redirect_to stocks_path
      else
         render 'new'
      end
   end
   
   
   def show
      @stock = Stock.find(params[:id])
   end
   
   def edit
      @stock = Stock.find(params[:id])
   end
   
   def update
      @stock = Stock.find(params[:id])      
      if @stock.update(stock_params)
         flash[:notice] = 'Stock successfully updated'
         redirect_to stocks_path
      else
         render 'edit'
      end
   end
   
   def destroy
      @stock = Stock.find(params[:id]) 
      @stock.destroy
      flash[:notice] = 'Stock successfully removed'
      redirect_to stocks_path
   end
   
   private
   def stock_params
      params.require(:stock).permit(:barcode, :name, :description, :quantity, :price)
   end
   
end