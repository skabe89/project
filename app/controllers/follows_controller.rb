class FollowsController < ApplicationController

  get '/add/:id' do
    @user = User.find_by(id: params[:id])
    add = Follow.new(follower_id: session[:user_id], following_id: @user.id)
    add.save
    binding.pry
    redirect '/'
  end

  get '/following' do
    @following = following
    binding.pry
    erb :'profile/following'
  end

  

end