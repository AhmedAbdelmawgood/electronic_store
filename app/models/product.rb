class Product < ActiveRecord::Base
	attr_accessor :company
	serialize :product_description
	belongs_to :company
	validates :company_id, presence: true
	validates :name,:price,:quantity,:category , presence: true
	validates :name, uniqueness: true
	scope :category, ->(category) {where category:category }
	scope :sub_category,->(sub) {where sub_category:sub}

	def available?
		!(quantity <= 0)
	end
	def sell(quan)
		new_quant = quantity-quan
		update_attribute(:quantity, new_quant) if new_quant > 0
	end
	def self.categories
		categories = {electronics: ["cellphone", "accessores", "tablets", "computers", "iphone", "ipad", "tv", "audio"],
								fashion: ["Men's","Women's","Kids","Jewelry&Watches","Handbags&Accessories","Health&Beauty","Shoes","Sales&Events"],
								collectable:["Antiques","Collectibles","Sports Memorabilia","Art","Entertainment Memorabilia"],
								home:["Home Décor","Home Improvement","Tools","Crafts","Baby","Kitchen, Dining & Bar","Yard, Garden & Outdoor"],
							  sporting:["Cycling","Golf","Hunting","Exercise & Fitness","Fishing","Outdoor Sports","Team Sports"],
							  motors:["Cars & Trucks","Motorcycles","Parts & Accessories","Boats","Other Vehicles","Powersports"]}
	end
	def self.main_categories
		categories.keys 
	end 
	def self.sub_categories(category)
		return categories[category] if (main_categories.include?category) 
		return false 
	end
end

     