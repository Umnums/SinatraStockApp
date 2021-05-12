class UserController < ApplicationController
    get '/signup' do
        erb :'users/new.html'
    end

    post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end
end