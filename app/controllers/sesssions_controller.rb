class SessionsController < ApplicationController

  get '/signup' do
    erb :'sessions/signup'
  end

  post '/signup' do
    user = User.new(params[:user])
    if user.save
      profile = user.build_profile(routine: "Update with your routine", bio: "Update with a quick bio!")
      profile.save
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end