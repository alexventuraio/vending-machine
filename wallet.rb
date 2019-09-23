class Wallet
	VALID_DENOMINATIONS = %w(a b c d e f g)

	attr_reader :balance

	def initialize
		@balance = 0
	end

	def add(input)
		case input
		when 'a'
			@balance += (0.01)
		when 'b'
			@balance += (0.05)
		when 'c'
			@balance += (0.10)
		when 'd'
			@balance += (0.25)
		when 'e'
			@balance += (0.50)
		when 'f'
			@balance += 1
		when 'g'
			@balance += 2
		end
	end
end
