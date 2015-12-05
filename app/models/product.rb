class Product < ActiveRecord::Base
    validates :product_name, presence: true
end