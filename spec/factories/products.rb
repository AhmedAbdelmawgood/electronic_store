FactoryGirl.define do
  factory :product do
  	transient do 
  		cate 'electronics'
  		sub_cate 'TV'
  		the_price 10
  	end
 		name { Faker::Commerce.product_name }
		image { Faker::Company.logo }
		price  {the_price}
		company {4}
		category { cate}
		sub_category {sub_cate }
		product_description {Faker::Lorem.paragraphs.join("\n")}
		product_information {Faker::Lorem.paragraphs.join("\n")}
		special_offers {Faker::Lorem.paragraphs.join("\n")}
		rates  {Faker::Number.between(1,5)}
		quantity {Faker::Number.between(100,1000)  }
		to_create {|instance| instance.save(validate:false)}

  end
end