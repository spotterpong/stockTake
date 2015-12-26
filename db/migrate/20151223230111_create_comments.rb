class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :contact_id
      t.string :comment_body
      t.timestamps
    end
  end
end
