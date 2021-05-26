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
            !!session[:user_id]
        end
        
        def login(email, password)
            user = User.find_by(email: email)
            if user && user.authenticate(password)
                session[:user_id] = user.id
                redirect "/users/#{user.id}"
            else
                redirect '/login'
            end
        end
    end

    

end