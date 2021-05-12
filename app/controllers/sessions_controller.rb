class SessionsController < ApplicationController
    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do
        login(params[:email, params[:password]])
        
    end

    post '/logout' do
        session.clear
    end

    helpers do 

        def logged_in?
            !!sessions[:user_id]
        end
        
        def log_in(email, password)
            user = User.find_by(email: email)
            if user && user.authenticate(password)
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                redirect_to '/login'
            end
        end
    end
end