module ApplicationHelper

  def current_cart
  	current_user.current_cart if current_user
  end

 	def checkout(cart)
 		if cart.status != "submitted"
 			button_to 'Checkout', checkout_path
 		end
 	end

  def new_current_cart
    current_user.current_cart = Cart.new
    current_cart.save
  end

end
