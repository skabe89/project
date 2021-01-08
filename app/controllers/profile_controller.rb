class ProfileController < ApplicationController

  get '/profile' do
    redirect_if_not_logged_in
    redirect "profile/#{current_user.id}"
  end

  get '/profile/:id' do
    redirect_if_not_logged_in
    find_user
    redirect_if_profile_not_found
    erb :'profile/show'
  end

  get '/profile/:id/edit' do
    redirect_if_not_logged_in
    find_user
    redirect_if_not_profile_owner
    erb :"profile/edit"
  end

  get '/profile/:id/products' do
    redirect_if_not_logged_in
    find_user
    @products = @user.products.all
    erb :"profile/products"
  end

  patch '/profile/:id' do
    current_user
    if current_user.profile.update(params[:profile])
      redirect "/profile/#{current_user.id}"
    else
      redirect "/profile/#{current_user.id}"
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def redirect_if_not_profile_owner
    redirect '/' unless @user == current_user
  end

  def redirect_if_profile_not_found
    redirect '/profile' unless @user
  end

end

#profile will belong to user, user will have one profile