class MessagesController < ApplicationController
  
  get '/messages' do
    @messages = current_user.messages.all.reverse
    erb :'messages/user'
  end

  get '/messages/:id' do
    @user = User.find_by(id: params[:id])
    erb :'messages/send'
  end

  post '/send' do
    @message = Message.create(user_id: params[:receiver_id], sender_id: session[:user_id], content: params[:content])
    erb :'messages/sent'
    # binding.pry
  end


end