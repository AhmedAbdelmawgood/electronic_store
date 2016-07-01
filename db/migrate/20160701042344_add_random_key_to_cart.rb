class AddRandomKeyToCart < ActiveRecord::Migration
  def change
    add_column :carts, :random_key, :string
  end
end
