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

    ActionCable.server.broadcast "messages_channel", {
      id: @message.id,
      name: @message.user.name,
      body: @message.body,
      created_at: @message.created_at.strftime("%b %e, %l:%M %p")
    }
    
    render "show.json.jbuilder"
  end
end
