class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :barcode
      t.text :name
      t.text :description
      t.integer :quantity
      t.float :price
      t.timestamps null: false
    end
  end
end
