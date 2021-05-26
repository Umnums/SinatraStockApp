class UsersController < ApplicationController
    get '/signup' do
        erb :'users/signup.html'
    end

    post '/signup' do
        @user = User.new
        @user.email = params[:email]
        @user.username = params[:username]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
        if @user.save
            login(params[:email], params[:password])
            redirect "/users/#{@user.id}"
        else

            redirect '/signup'
        end
    end

    get '/users/:id' do
        if logged_in? && session[:user_id] == params[:id].to_i
            @user = User.find(params[:id])
            erb :'users/show.html'
        else
            erb :'users/signup.html'
        end
    end

end