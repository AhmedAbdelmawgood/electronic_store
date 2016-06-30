module ProductsHelper
	def map_hash_to_select(hash)
		result = []
		hash.keys.each do |key| 
			hash[key].each { |value| result.append ["#{key.to_s} || #{value}","#{key.to_s}_#{value}"] }
		end 
		result 
	end
end
