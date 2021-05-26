class SessionsController < ApplicationController 
    get '/portfolios/:id' do
        if !logged_in?
            redirect '/login.html'
        else
            if current_user.portfolios.find_by(params[:id])
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
            portfolio.save
            current_user.portfolios << portfolio
            portfolio.user = current_user
            redirect "/users/#{current_user.id}"
        end

    end

    

end