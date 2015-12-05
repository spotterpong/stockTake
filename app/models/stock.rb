class Stock < ActiveRecord::Base
    
    validates :barcode, :name, :description, presence: true 
    validates :barcode, uniqueness: true
    validates :quantity, :price, presence: true
    
end
