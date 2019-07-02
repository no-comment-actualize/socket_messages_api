class Api::MessagesController < ApplicationController
  def index
    @messages = Message.all.order(id: :desc)
    render 'index.json.jbuilder'
  end

  def create
    @message = Message.new(
      user_id: current_user.id,
      body: params[:body]
    )
    @message.save
    
    render "show.json.jbuilder"
  end
end
