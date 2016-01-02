class AddCommentBodyAndContactIdToCommentsTable < ActiveRecord::Migration
  def change
    add_column :comments, :comment_body, :string
    add_column :comments, :contact_id, :string
  end
end
