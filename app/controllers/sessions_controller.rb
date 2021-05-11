class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login.html'
    end

    post '/sessions' do
        raise params.inspect
    end

   
end