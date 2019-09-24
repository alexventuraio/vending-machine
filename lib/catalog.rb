class Catalog
	attr_reader :products

	def initialize(initial_catalog = [])
		@products = initial_catalog
	end
end
