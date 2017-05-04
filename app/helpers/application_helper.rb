module ApplicationHelper

  def current_cart
  	@current_user.current_cart
  end

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
 	end
end
