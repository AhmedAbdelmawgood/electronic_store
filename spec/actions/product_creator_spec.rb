require 'rails_helper'
RSpec.describe ProductCreator do 
	describe "initialize new peoduct" do
		let(:company) { Company.create(name:'somexp',location:'address') }
		let(:product) {ProductCreator.new(name:'test1',price:300,quantity: 10,category:'electronics||cellphone', company_name:'somexp', product_description:"This is some text here\nand another test here")} 
		let(:creator) {ProductCreator.new}
		it "know about the category and sub category" do 
			creator.category = "electronics||cellphone"
			result = creator.get_category
			expect(result).to eq(["electronics","cellphone"])
		end
		# it "prase description on break lines" do 
		# 	creator.description = "This is line one\nthis is line two"
		# 	result = creator.bulleting_description
		# 	expect(result).to eq(["This is line one","this is line two"])
		# end
		it "create new product if valid" do 
			company 
			validity = product.create
			# puts product.product.company_id,product.product.price
			# puts product.product.errors.full_messages
			# puts product.product.company_id
			expect(validity).to be_truthy
		end
	end
end