class ShoppingCart
	attr_reader :items

	def initialize
		@items = []
	end

	def get_total
		@items.map(&:price).inject(0, &:+)
	end

	def add_item(item)
		@items << item
	end
end
