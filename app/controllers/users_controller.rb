class UsersController < ApplicationController

  get '/search' do
    erb :'users/search'
  end

  post '/search' do
    @users = User.where("username like ?", "%#{params[:username]}%")
    # binding.pry
    if !@users.empty?
      erb :'users/found'
    else
      erb :'users/not-found'
    end
  end

  get '/users' do
    @users = User.all
    erb :'users/list'
  end

end