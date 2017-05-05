class LineItemsController < ApplicationController

	def create
		if !current_cart
			@cart = current_user.current_cart.build
			@cart.status = "new"
		end
		current_cart.add_item(line_items_params)
		redirect_to cart_path(current_cart)
	end

	private

	def line_item_params
		params.require(:line_item).permit(:item_id)
	end

end
