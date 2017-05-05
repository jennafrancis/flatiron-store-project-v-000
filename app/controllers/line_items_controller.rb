class LineItemsController < ApplicationController

	def create
		new_current_cart unless current_cart
		@line_item = current_cart.add_item(params[:item_id])
		@line_item.save
		current_cart.save
		redirect_to cart_path(current_cart)
	end

end
