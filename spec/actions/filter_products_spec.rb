require 'rails_helper'
RSpec.describe FilterProducts do 
	let(:product_fash) { create(:product,cate:'fashion',sub_cate:'kids') }
	let(:product1) { create(:product,cate:'fashion',sub_cate:'kids',price:500) }
	let(:product2) { create(:product,cate:'fashion',sub_cate:'kids',price:100) }
	let(:product3) { create(:product,cate:'electronics',sub_cate:'TV',price:150) }
	let(:product4) { create(:product,cate:'fashion',sub_cate:'Men\'s',price:110) }
	let(:product5) { create(:product,cate:'fashion',sub_cate:'kids',price:10) }
	let(:params) {{price:'100,200',category:'fashion',sub_category:['kids'],
								 rates:3}}
	before(:each) do 
		product1; product2; product3; product4; product5
		@filter = FilterProducts.new
	end
	it "Analyze Params the right way" do 		
		@filter = FilterProducts.new(params)  
		expect(@filter.price_max).to eq("200")
		expect(@filter.price_min).to eq("100")
		expect(@filter.category).to eq('fashion')
		expect(@filter.sub_category).to eq(['kids'])
	end
	it "find products within the ranged price" do
		@filter.price_max="200"
		@filter.price_min="100"
		@filter.filter 
		products = @filter.products
		expect(products.count).to eq(3) 
	end
	it "find products which specific category" do
		@filter.category = 'electronics'
		@filter.filter
		expect(@filter.products.count).to eq(1)
	end
	it 'find products with subcategory' do 
		@filter.sub_category =['kids']
		@filter.filter 
		expect(@filter.products.count).to eq(3)
	end
	it 'accept multiple subcategory'do 
		@filter.sub_category = 				['kids','Men\'s']
		@filter.filter
		expect(@filter.products.count).to eq(4)		
	end
	it 'return all products if no params' do 
		filter=FilterProducts.new({sub_category:['',""]})
		filter.filter 
		expect(filter.products.count).to eq(5)
	end
	it 'can get all the products greates than price' do
		filter = FilterProducts.new( {price:'150,0'} )
		filter.filter
		expect(filter.products.count).to eq(2)
	end
end