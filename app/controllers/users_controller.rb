class UsersController < ApplicationController

  get '/search' do
    redirect_if_not_logged_in
    erb :'users/search'
  end

  post '/search' do
    @users = User.where("username like ?", "%#{params[:username]}%")
    erb :'users/found'
  end

  get '/users' do
    redirect_if_not_logged_in
    @users = User.all
    erb :'users/list'
  end

end