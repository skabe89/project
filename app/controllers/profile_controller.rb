class ProfileController < ApplicationController

  get '/profile' do
    erb :'profile/index'
  end

  get '/profile/:id' do
    @user = User.find_by(id: params[:id])
    erb :'profile/show'
  end

  get '/profile/:id/edit' do
    @user = User.find_by(id: params[:id])
    erb :"profile/#{@user.id}"
  end

  

end

#profile will belong to user, user will have one profile