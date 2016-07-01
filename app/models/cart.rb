class Cart < ActiveRecord::Base
	serialize :products	 #don't remove it
		# validates :products,presence: true
	before_create {self.products = {}}
	# after_touch do |cart|
	# 	puts products
	# 	cart.save
	# end doesn't work as expected
	def add_product(product,quant=1)
		product_id = product.id
		if exist?(product_id)
			products[product_id]  += quant
		else
			products[product_id]  = quant 
		end
		save
	end
	def exist?(product_id)
		product_id = product_id.id if Product === product_id
		return true if products.keys.include?product_id
	end
	def get_product_quantity(product)
		id = product.id
		products[id]
	end
	def reduce_quantity(product,quantity)
		id = product.id
		products[id] -=quantity unless products[id] < quantity
		save
	end
	def total_price
		price = products.inject(0) do  |sum,id_quant| 
			id = id_quant[0]
			quant = id_quant[1]
			price = Product.find(id).price
			sum += price*quant  
		end
	end
	def get_products_quant
		products.map do |x,y|
			[Product.find(x),y]
		end
	end
	# def remove_product(product)
	# 	# if 
	# end
end
