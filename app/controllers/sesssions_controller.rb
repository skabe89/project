class SessionsController < ApplicationController

  get '/signup' do
    erb :'sessions/signup'
  end

  post '/signup' do
    user = User.new(params[:user])
    if user.save
      profile = user.build_profile(morning_routine: "Update with your morning routine", evening_routine: "Update with your evening routine", bio: "Update with a quick bio!")
      profile.save
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    redirect_to_create_account_if_no_users
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  private
    def redirect_to_create_account_if_no_users
      redirect '/signup' unless users_occupied?
    end
end