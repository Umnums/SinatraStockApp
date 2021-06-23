class StocksController < ApplicationController 
    post '/stocks/new' do
        stock = Stock.find_or_create_by_ticker
        if stock
            history[stock.name] = {}
            history[stock.name][:purchase_price] = stock.current_price
            history[stock.name][:number_shares] = 
            flash[:message] = "Purchased #{}" 
        else
            flash[:message] = "No stock found by that symbol"
        end
    end



end