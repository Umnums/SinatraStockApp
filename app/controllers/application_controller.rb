class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "carcollection"
    
    end

    get '/' do
        "Hello World!"
    end

    helpers do 

        def logged_in?
            !!current_user
        end
        
        def login(username, password)
            user = User.find_by(username: username)
            if user && user.authenticate(password)
                session[:user_id] = user.id
                redirect "/users/#{current_user.id}"
            else
                redirect '/login'
            end
        end
    end

    def current_user
        User.find(session[:user_id])
    end

end