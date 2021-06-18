class StocksController < ApplicationController 
    post '/stocks/new' do
        stock = Stock.find_or_create_by_ticker
    end



end