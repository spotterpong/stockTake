class Contact < ActiveRecord::Base

 belongs_to :user    
 has_many :comment
 validates :name, presence: true
 validates :name, uniqueness: true
 
  def self.search(search)
     where("name LIKE ?", "%#{search}%")
  end
    
 
end
