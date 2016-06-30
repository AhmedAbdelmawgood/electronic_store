class ProductCreator
	attr_accessor :product,:quantity, :name,:price, :company_name, :description, :information, :category
	def initialize(opt={})
		@product = Product.new
		@name = opt[:name]
		@price = opt[:price]
		@company_name = opt[:company]
		@category = opt[:category]
		@description = opt[:product_description]
		@information = opt[:product_information]
		@quantity = opt[:quantity]
	end

	def builder
		product.name = name
		product.company_id = get_company_id
		product.product_description = description
		product.product_information = information
		product.category, product.sub_category = get_category
		product.price = price 
		product.quantity = quantity
	end
	def create
		builder
		product.save
	end
	def get_company_id
		name = ( Company.find_by(name: company_name) ) if company_name 
		name.id if name
	end
	def get_category
		category.split("||") if category
	end

end