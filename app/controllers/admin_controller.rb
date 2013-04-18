class AdminController < ApplicationController
  def login
    if params[:password] == 'veronica'
      cookies[:password] = 'veronica'
    end
    redirect_to :controller => 'news', :action => 'all'
  end

  def logout
    cookies.delete(:password)
    redirect_to :controller => 'news', :action => 'all'
  end
end