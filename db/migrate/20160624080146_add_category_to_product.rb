class AddCategoryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :category, :string
    add_column :products, :sub_category, :string 
    add_column :products, :product_description,:text
    add_column :products, :product_information,:text 
    add_column :products, :special_offers,:text
    add_column :products, :rates, :float 
  end
end
