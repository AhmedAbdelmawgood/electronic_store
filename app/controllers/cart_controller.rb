class CartController < ApplicationController
	def index 
		@cart = Cart.find(user_cart)
	end
	def new
		product = Product.find(params[:id])
		user_cart.add_product(product)
		redirect_to cart_path
	end
	def user_cart
		cart = find_or_create_cart
		Cart.find_by(random_key:cart)
	end
	def	find_or_create_cart
		session[:cart_id] ||= new_cart		
	end
	def new_cart
		x = Cart.create(random_key: random_num)
		puts x.errors.full_messages
		puts x.random_key 
		puts x.products
		x.random_key
	end
	def random_num
		rand(0..100000000000000000)
	end
end
