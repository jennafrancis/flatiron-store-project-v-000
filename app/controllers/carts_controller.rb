class CartsController < ApplicationController
	before_action :set_cart!, only: [:show, :checkout]

	def show

	end

	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.create(cart_params)
		# @cart.status = ""
		current_user.current_cart = @cart
	end

	def checkout
		redirect_to cart_path(current_cart)
		@cart.remove_items
		current_user.current_cart = nil
	end

	private

	def set_cart!
		@cart = Cart.find_by_id(params[:id])
	end

	def cart_params
		params.require(:cart).permit(:user_id)
	end
end
