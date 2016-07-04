class MainPageController < ApplicationController
	def index
		@new_products = Product.new_release.first(5)
	  @categories = Product.main_categories  	
	end
end
