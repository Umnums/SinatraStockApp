class CreateStockPortfolios < ActiveRecord::Migration
  def change
    create_table :stock_portfolios do |t|
      t.integer :stock_id
      t.integer :portfolio_id
    end
  end
end
