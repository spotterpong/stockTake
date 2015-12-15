class Stock < ActiveRecord::Base
    belongs_to :user
    validates :barcode, :name, :description, presence: true 
    validates :barcode, uniqueness: true
    validates :quantity, :price, presence: true
    validates :user_id, presence: true

    def self.search(search)
        if search
            where("name LIKE ?", "%#{search}%") 
            where("description LIKE ?", "%#{search}%")
         else
             scoped
         end
         
    end
    
end
