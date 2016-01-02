class RemoveCommentIdAndAddCommentId < ActiveRecord::Migration
  def change
    remove_column :comments, :contact_id
    add_column :comments, :contact_id, :integer
  end
end
