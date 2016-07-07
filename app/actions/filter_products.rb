class FilterProducts
	attr_accessor :price_max,:price_min,:category,:sub_category,:products
	def initialize(params={})
		@price_min,@price_max  = params[:price].split(',') if params[:price]
		@category = params[:category] 
		@sub_category = [params[:sub_category]].flatten.compact #it take array of sub categories
	end
	def reset
		initialize
	end
	def filter
		@products = Product.all
		filter_price
		filter_category		
		filter_sub_category
	end
	private
	def filter_category
		@products = @products.where('category = ?',category) if category
	end
	def filter_sub_category
		@sub_category = @sub_category.reject {|a|a.empty?}
		if !sub_category.empty?
			@products = @products.where(sub_category: sub_category) 
		end
	end
	def filter_price
		@products = @products.where('price >= ?',price_min) if price_min && price_min.to_i != 0
		@products = @products.where('price <= ?',price_max) if price_max && price_max.to_i != 0
	end
end