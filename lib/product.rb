class Product
	attr_reader :name, :code, :price

	def initialize(name, code, price)
		@name = name.strip
		@code = code.strip
		@price = price.strip.to_f
	end
end
