class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer :price  
    	t.string :name 
    	t.belongs_to :company  
    	t.integer :quantity
      t.timestamps null: false
    end
  end
end
