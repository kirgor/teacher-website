module ApplicationHelper
  def admin?
    !cookies[:password].nil? && cookies[:password] == 'veronica'
  end
end
