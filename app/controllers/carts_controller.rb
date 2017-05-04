class CartsController < ApplicationController
	before_action :set_cart!, only: [:show]

	def show

	end

	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.create(cart_params)
		current_user.current_cart = @cart
	end

	private

	def set_cart!
		Cart.find_by_id(params[:id])
	end

	def cart_params
		params.require(:cart).permit(:user_id)
	end
end
