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
    
    def self.import(file, user)
        count = 0
        CSV.foreach(file.path, headers: true) do |row|
           new_stock = Stock.create row.to_hash
           new_stock.user = user
           if !new_stock.save
               count +=1
           end
        end
        return true, count
    end
end
