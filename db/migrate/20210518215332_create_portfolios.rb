class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :description
      t.decimal :starting
      t.decimal :current
      t.text :history
      t.integer :user_id
      
    end
  end
end
