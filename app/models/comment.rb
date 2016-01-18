class Comment < ActiveRecord::Base
    default_scope { order('created_at ASC') }
    belongs_to :contact
    validates :contact_id, :comment_body, presence: true
    validates :comment_body, length: { minimum: 5 }
    
end