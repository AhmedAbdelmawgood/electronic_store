class Company < ActiveRecord::Base
	has_many :products
	validates :location, :name, presence: true
end
