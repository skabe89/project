class MessagesController < ApplicationController
  
  get '/messages' do
    redirect_if_not_logged_in
    all_messages = Message.all
    @messages = all_messages.select{|i|i.user_id == current_user.id || i.sender_id == current_user.id}.reverse
    @messages
    erb :'messages/user'
  end

  get '/messages/:id' do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    redirect_if_user_not_found
    erb :'messages/send'
  end

  post '/send' do
    @message = Message.create(user_id: params[:receiver_id], sender_id: session[:user_id], content: params[:content])
    #flash success
    redirect 'messages'
    # binding.pry
  end

  private
  def redirect_if_user_not_found
    redirect '/messages' unless @user
  end
end