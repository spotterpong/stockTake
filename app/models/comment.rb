class Comment < ActiveRecord::Base
    belongs_to :contact
    validates :contact_id, :comment_body, presence: true
    validates :comment_body, length: { minimum: 5 }
    
end