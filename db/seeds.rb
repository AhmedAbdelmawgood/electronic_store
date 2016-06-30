# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Company.destroy_all
Product.destroy_all
def companies
	ary = []
	10.times do 
		com_name = Faker::Company.name 
		com_address = Faker::Address.street_address 
		ary.append(Company.create(name:com_name,location:com_address))
	end
	ary
end
def get_rand_main_category
	categories = Product.main_categories
	10.times {categories.shuffle!}
	categories[0]
end
def get_rand_sub_category(main)
	subs = Product.categories[main]
	10.times {subs.shuffle!}
	subs[0]
end
def get_random_com
	@com.shuffle[0]
end
@com = companies
puts get_random_com.id
700.times do
	main_cate = get_rand_main_category
	puts 'lol'
	text = Faker::Lorem.paragraphs.join("\n")
	pro = {name: Faker::Commerce.product_name,
				 image:Faker::Company.logo,
				 company_id:get_random_com.id,
				 price: Faker::Number.number(3),
				 category:main_cate,
				 sub_category:get_rand_sub_category(main_cate),
				 product_description:text,
				 product_information:text,
				 special_offers: text,
				 rates: Faker::Number.between(1,5),
				 quantity:Faker::Number.between(100,1000)
				 }
	x = Product.create(pro)
	# puts Product.find(x.id).quantity
end
