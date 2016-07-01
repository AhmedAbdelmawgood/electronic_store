class AddRandomKeyToCart < ActiveRecord::Migration
  def change
    add_column :carts, :random_key, :integer,limit:16
  end
end
