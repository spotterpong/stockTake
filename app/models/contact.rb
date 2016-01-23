class Contact < ActiveRecord::Base
default_scope {order('lower(name)')}
 belongs_to :user    
 has_many :comments, dependent: :destroy
 validates :name, presence: true
 validates :name, uniqueness: true
 
  def self.search(search)
     where("name LIKE ?", "%#{search}%")
  end
    
 
end
