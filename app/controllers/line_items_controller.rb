class LineItemsController < ApplicationController

	def create
		if !current_cart
			current_user.current_cart = Cart.new
			current_cart.save
		end
		@line_item = current_cart.add_item(params[:item_id])
		@line_item.save
		current_cart.save
		redirect_to cart_path(current_cart)
	end

end
