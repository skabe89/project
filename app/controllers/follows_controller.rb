class FollowsController < ApplicationController

  get '/add/:id' do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    redirect_if_user_not_found
    redirect_if_attempting_to_follow_self
    if already_following?(@user.id)
      "already following!"
    else
      add = Follow.new(follower_id: session[:user_id], following_id: @user.id)
      add.save
      redirect "/profile/#{@user.id}"
    end
  end
  
  get '/following' do
    redirect_if_not_logged_in
    @following = following
    erb :'profile/following'
  end
  
  get '/followers' do
    redirect_if_not_logged_in
    @followers = followers
    erb :'profile/followers'
  end

  private
  def redirect_if_user_not_found
    redirect '/profile' unless @user
  end

  def redirect_if_attempting_to_follow_self
    if @user == current_user
      redirect '/profile'
    end
  end
  
end