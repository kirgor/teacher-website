class MessageController < ApplicationController
  def all
    @messages = Message.all
  end

  def add
    Message.create(:author => params[:author], :content => params[:content], :datetime => Time.now)
    redirect_to :controller => 'news', :action => 'all'
  end
end