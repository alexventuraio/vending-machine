class Catalog
	attr_reader :products

	def initialize(initial_catalog = [])
		@products = initial_catalog
	end

	def print_catalog
		output_lines = []
		output_lines << "\n********** This is my menu ***********"

		@products.each do |product|
			output_lines << "#{product.code} - $#{product.price} - #{product.name}"
		end

		output_lines << "**************************************"
	end
end
