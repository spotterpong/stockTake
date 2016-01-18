class Stock < ActiveRecord::Base
    default_scope { order('created_at ASC') }
    belongs_to :user
    validates :barcode, :name, :description, presence: true 
    validates :barcode, uniqueness: true
    validates :quantity, :price, presence: true
    validates :user_id, presence: true

    def self.search(search)
        if search
            where("name LIKE :search OR description LIKE :search",search: "%#{search}%") 
            #where("description LIKE ?", "%#{search}%")
         end
         
    end
    
end
