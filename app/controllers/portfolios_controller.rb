class PortfoliosController < ApplicationController 
    get '/portfolios/:id' do
        if !logged_in?
            redirect '/login.html'
        else
            if current_user.portfolios.find_by(id: params[:id])
                @portfolio = Portfolio.find_by(id: params[:id])
                @stocks = @portfolio.history.keys
                erb :'portfolios/show.html'
            else
                redirect "/users/#{current_user.id}"
            end
        end
    end

    post '/portfolios/new' do
        if !logged_in?
            redirect '/login.html'
        else
            portfolio = Portfolio.new()
            portfolio.name = params[:name]
            portfolio.description = params[:description]
            portfolio.starting = params[:starting]
            portfolio.current = params[:starting]
            portfolio.history = {}
            portfolio.save
            current_user.portfolios << portfolio
            portfolio.user = current_user
            redirect "/users/#{current_user.id}"
        end

    end

    post '/portfolio/new_stock' do
        @stock = Stock.find_or_create_by_ticker(params[:name])
        @stock.update_price
        purchase_quantity = params[:number_shares].to_i
        cost = @stock.current_price * purchase_quantity
        @portfolio = Portfolio.find_by(id: params[:id])
        
        if !(@portfolio.current >= cost)
            flash[:message] = "Not enough funds to complete this transaction"
        elsif !@stock
            flash[:message] = "No stock found on the NYSE under this symbol"
        elsif @stock && @portfolio.current >= cost
            @portfolio.current = @portfolio.current-cost
            shares = params[:share_number].to_i
            if @portfolio.history.keys.include?(@stock.symbol)
                history = @portfolio.history[@stock.symbol]
                history[:purchase_price] = @portfolio.cost_basis(history[:purchase_price], history[:shares], @stock.current_price, shares)
                history[:shares] += shares
                @portfolio.save
                flash[:message] = "Purchased #{shares} shares of stock for #{cost}."    

            else
                history = @portfolio.history[@stock.symbol]={}
                history[:purchase_price] =@stock.current_price
                history[:shares] = shares
                @portfolio.save
                binding.pry

                flash[:message] = "Purchased #{shares} shares of stock for #{cost}."    
            end

        end

    end
    

end