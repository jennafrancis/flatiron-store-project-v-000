module ApplicationHelper

  def current_cart
  	current_user.current_cart if current_user
  end

 	def checkout(cart)
 		if cart.status != "submitted"
 			button_to 'Checkout', checkout_path
 		end
 	end

end
