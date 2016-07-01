FactoryGirl.define do
  factory :product do
 		name { Faker::Commerce.product_name }
		image { Faker::Company.logo }
		price  10
		company {4}
		category { "electronics" }
		sub_category {"TV" }
		product_description {Faker::Lorem.paragraphs.join("\n")}
		product_information {Faker::Lorem.paragraphs.join("\n")}
		special_offers {Faker::Lorem.paragraphs.join("\n")}
		rates  {Faker::Number.between(1,5)}
		quantity {Faker::Number.between(100,1000)  }
		to_create {|instance| instance.save(validate:false)}
  end
end
