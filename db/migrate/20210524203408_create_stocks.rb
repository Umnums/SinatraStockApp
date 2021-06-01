class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.integer :current_price
      t.integer :daily_percent
      t.integer :daily_value
      

    end
  end
end
