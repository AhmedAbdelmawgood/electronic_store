class ProductsController < ApplicationController
	before_filter :authenticate_user!,only:[:new,:create,:edit,:update,:delete,:destroy]
	def index
		@categories = Product.main_categories
		# @products = Product.category(params[:category]).paginate(page: 1,per_page:10)
	end
	def new
		@product = Product.new
	end
	def create
		@product = ProductCreator.new(white_params)
		if @product.create 
			redirect_to( product_path(@product.product.id) )
		else
			@product = @product.product
			render :new
		end
	end
	def category
		if params[:filter]
			# fail
			filter
		else
		(params[:page] = 1 ) unless params[:page]
		@category = params[:category] 
		@products = Product.category(params[:category]).paginate(page: params[:page],per_page:10)
		end
	end 
	def show
		@product = Product.find(params[:id])
	end
	def edit
		@product = Product.find(params[:id])
		@product.company = Company.find(@product.company_id).name
		#displaying the company namein the edit field
	end
	def update
		@product = Product.find(params[:id])
		@product.company_id = Company.find_by(name: params[:product][:company]).id
		#previous to extract the company information by its name
		if @product.update_attributes(white_params)
			redirect_to product_path @product
		else
			# puts Company.all.each {|x|puts x.name}
			# puts Company.find_by(name: params[:company])

			render :edit
		end
	end
	def filter
		filtered = FilterProducts.new(filter_params)
		filtered.filter
		puts filtered.products 
		@products = filtered.products.paginate(page:params[:page],per_page:10)
		@category = params[:filter][:category]
		render :category
	end
	def filter_params
		params.require(:filter).permit(:category,:price,sub_category:[])
	end
	def white_params
		params.require(:product).permit(:name, :price, :company, :product_description,
																	 :product_information, :category,:quantity)
	end
	# def delete
	# end
	# def destroy
	# end
end
