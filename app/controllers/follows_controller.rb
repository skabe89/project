class FollowsController < ApplicationController

  get '/add/:id' do
    @user = User.find_by(id: params[:id])
    already_following = Follow.where(["follower_id = ? and following_id = ?", current_user, @user.id])
    if !already_following.empty?
      "already following!"
    else
      add = Follow.new(follower_id: session[:user_id], following_id: @user.id)
      add.save
      redirect '/'
    end
  end

  get '/following' do
    @following = following
    erb :'profile/following'
  end

  get '/followers' do
    @followers = followers
    erb :'profile/followers'
  end

end