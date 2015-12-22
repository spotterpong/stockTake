class RemoveCreateAtAndAddCreatedAtToContaccts < ActiveRecord::Migration
  def change
    add_column :contacts, :created_at, :datetime
  end
end
