require 'csv'

class CatalogLoader
	class << self
		def load_products(file_name)
			products = []
			CSV.foreach(file_name) do |row|
				products << Product.new(row[0], row[1], row[2])
			end
			products
		rescue Errno::ENOENT
			puts "File not found."
			[]
		end
	end
end
