class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string name
      t.string description
      t.integer starting
      t.integer current
      
    end
  end
end
