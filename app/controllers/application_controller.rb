require './config/environment'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    favorites = Product.all.where(:favorite => "on")
    @featured = favorites.sample
    @featured_user = User.find_by(id: @featured.user_id) if @featured
    erb :welcome
  end

  get "/test" do
    erb :test
  end

  helpers do 
    def users_occupied?
      !User.all.empty?
    end

    def redirect_if_users_empty
      redirect "/" unless users_occupied?
    end

    def is_logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def redirect_if_logged_in
      # flash[:errors] = ["You are already logged in."]
      redirect '/products' if is_logged_in?
     end
  
     def redirect_if_not_logged_in
      # flash[:errors] = ["You must be logged in."]
      redirect '/' unless is_logged_in?
     end

    def following
      Follow.where(follower_id: session[:user_id]).collect do |i|
        User.find_by(id: i.following_id)
      end
    end

    def followers
      Follow.where(following_id: session[:user_id]).collect do |i|
        User.find_by(id: i.follower_id)
      end 
    end

    def already_following?(user_id)
      !Follow.where(["follower_id = ? and following_id = ?", current_user, user_id]).empty?
    end
  end
end
