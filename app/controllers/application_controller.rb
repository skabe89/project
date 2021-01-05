require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    erb :welcome
  end

  get "/new" do
    erb :new
  end


  helpers do 
   def is_logged_in?
     !!session[:user_id]
   end

   def current_user
    User.find_by(id: session[:user_id])
   end
  end
end
