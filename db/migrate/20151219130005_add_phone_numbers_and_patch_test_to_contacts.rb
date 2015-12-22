class AddPhoneNumbersAndPatchTestToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :home_phone, :integer
    add_column :contacts, :mobile_phone, :integer
    add_column :contacts, :patch_test, :boolean
    add_column :contacts, :patch_test_time, :datetime
    add_column :contacts, :updated_at, :datetime
  end
end
