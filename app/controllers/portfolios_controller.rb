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
        portfolio = Portfolio.new()
        portfolio.name = params[:name]
        portfolio.desc = params[:description]
        portfolio.starting = params[:starting]
        portfolio.save
    end

    

end