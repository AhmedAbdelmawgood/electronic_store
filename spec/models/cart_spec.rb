require 'rails_helper'

RSpec.describe Cart, type: :model do
  
  describe "creation of new instance in the cart" do 
	  let(:cart) { Cart.create }
	  let(:product1) 					{double("product")}
	  before(:example) do 
	  	allow(product1).to receive(:id) {5}
	  	cart.add_product(product1,6)	  	
	  end
	  it "adding new Product to cart with quantity" do #hadn't been added before 
			expect( cart.exist?(product1.id) ).to be_truthy
			expect( cart.get_product_quantity(product1)).to eq(6)
	  end
	  it "accumulate the products count" do 
			cart.add_product(product1,6)
			expect( cart.get_product_quantity(product1) ).to eq(12)
	  end
	end
	describe "main operaiotn on carts" do
	  let(:cart) { Cart.create}		
	  let(:product1)					{create :product}		
	  let(:product2)					{create :product}
	  let(:product3)					{create :product}	 
	  it "reduce quantity wanted if needed" do
	  	cart.add_product(product1,6) 
	  	cart.reduce_quantity(product1,4)
	  	expect( cart.get_product_quantity(product1) ).to eq(2)
	  end
	  it "doesn't quantity allow reduciton below 0" do 
	  	cart.add_product(product1,6) 
	  	cart.reduce_quantity(product1,100)
	  	expect( cart.get_product_quantity(product1) ).to eq(6)
	  end
	  it "compete the total price of the cart" do 
	  	cart.add_product(product1,6)
	  	cart.add_product(product2,5)
	  	cart.add_product(product3,4)
	  	expect( cart.total_price ).to eq(6*10+5*10+4*10)
	  	#couldn't test this because what is stored is the id of the product and they are stubs
	  	# expect(product1).to be_truthy
	  end
	end
end
