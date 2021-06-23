class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.decimal :current_price
      t.decimal :daily_percent
      t.decimal :daily_value
      

    end
  end
end
