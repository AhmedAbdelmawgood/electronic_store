class ThumbPagesController < ApplicationController
	def index
		# params[:page] = 1
		# show 
		@products = Product.paginate(page: 1,per_page:10)
	end

	def show 
		@products = Product.paginate(page:params[:page],per_page:10)
		render 'thumb_pages/index'
	end
end
