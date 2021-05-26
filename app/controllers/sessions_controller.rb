class SessionsController < ApplicationController 
    get '/login' do
        erb :'sessions/login.html'
    end

    post '/login' do
        login(params[:username], params[:password])
    end
   

    post '/logout' do
        session.clear
    end

end