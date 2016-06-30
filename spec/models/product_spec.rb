require 'rails_helper'

RSpec.describe Product do
	company = Company.create(name:'somexp',location:'address') #very bad it add one new icon each time 
	let(:product) {Product.new(name:'test1',price:300,quantity: 10,category:'electronics', company_id:company.id)} 
	describe "new product validation" do
		let(:product2) {Product.new(name:'test2',price:300,quantity: 5,category:'electronics',company_id:company.id)}
		
		it "valid if it have complete information" do 
			expect(product).to be_valid
		end
		it "not valid if no category" do 
			product.category = nil
			expect(product).not_to be_valid 
		end
		it "should have a name" do 
			product.name = nil 
			expect(product).not_to be_valid
		end
		it "have a unique name" do 
			product2.name = product.name
			product.save
			expect(product2).not_to be_valid
		end
		it "should have a price" do 
			product.price = nil 
			expect(product).not_to be_valid
		end
		it "should have quantity" do 
			product.quantity = nil 
			expect(product).not_to be_valid

		end
		it "belongs to existed company" do
			product.company_id = nil 
			expect(product).not_to be_valid 
		end
	end
	describe "product logic" do 
		it "if no available pieces the product is unavailable" do 
			product.quantity = 0 
			expect(product).not_to be_available
		end
		it "reduce the number of avaiable parts on selling" do 
			product.save
			prev = product.quantity
			product.sell(4)
			expect(product.quantity).to eq(prev-4)
		end

	end  

end