require 'pry'
require_relative 'catalog'
require_relative 'catalog_loader'
require_relative 'product'
require_relative 'shopping_cart'
require_relative 'wallet'

class VendingMachineView
	def initialize(catalog_file = 'products.csv')
		@catalog = Catalog.new(CatalogLoader.load_products(catalog_file))
		@shopping_cart = ShoppingCart.new
		@wallet = Wallet.new
	end

	def start
		print_welcome_msg
		print_products_menu
		step_load_money
		return if @refund
		step_select_products
		step_finilize_cycle
	end

	private

	def step_finilize_cycle
		@shopping_cart = ShoppingCart.new
		@wallet = Wallet.new
	end

	def show_vended_products
		puts "\n\nYour products are:"
		@shopping_cart.items.each do |item|
			puts "- #{item.name}"
		end
		show_refund
	end

	def show_refund
		puts "\nYour change is: #{(@wallet.balance - @shopping_cart.get_total).round(2)}"
	end

	def show_anything_else
		puts "\nWould like to purchase anything else?"
		puts "y=YES \t\t n=NO"
		print "> "
	end

	def step_anything_else
		show_anything_else

		user_input = gets.chomp

		if user_input.downcase == 'y'
			step_select_products
		else
			show_vended_products
		end
	end

	def show_not_enough_funds(amount = 0)
		puts "\n########## Error: Not enough funds! ##########"
		puts "\n########## You need to add #{amount}! ##########"
	end

	def validate_balance
		result = @wallet.balance - @shopping_cart.get_total

		case
		when result == 0
			show_vended_products
		when result < 0
			show_not_enough_funds(result.abs)
			step_load_money
			validate_balance
		when result > 0
			step_anything_else
		end
	end

	def show_select_product_promt
		puts '-' * 90
		print "\n\nEnter product code > "
	end

	def search_product_by_code(code)
		code.strip!
		selected_product = @catalog.products.find do |product|
			product.code.downcase.eql?(code.downcase)
		end
	end

	def step_select_products
		show_select_product_promt
		user_input = gets.chomp

		product = search_product_by_code(user_input)

		if product
			@shopping_cart.add_item(product)
			validate_balance
		else
			print_products_menu
			puts "\n########## Error: Unknown product code! ##########"
			step_select_products
		end
	end

	def show_money_menu
		puts "\n\nCoins accepted: a=¢1, b=¢5, c=¢10, d=¢25, e=¢50 \tNotes accepted: f=$1, g=$2"
		if @wallet.balance > 0
			puts "Balance: $#{@wallet.balance.round(2)} \t\tp=Select product \t\tx=Candel & Refund"
		end
		print 'Insert coin > '
	end

	def step_load_money
		show_money_menu

		while user_input = gets.chomp # loop while getting user input
			if Wallet::VALID_DENOMINATIONS.include?(user_input)
				@wallet.add(user_input)
			elsif @wallet.balance > 0 && user_input.eql?('p')
				break
			elsif @wallet.balance > 0 && user_input.eql?('x')
				show_refund
				@refund = true
				break
			else
				puts "\n\n########## Error: Unknown command! ##########"
			end

			show_money_menu
		end
	end

	def print_products_menu
		puts @catalog.print_catalog
	end

	def print_welcome_msg
		puts "\n\n===== Welcome to Vending Machine ====="
	end
end

machine = VendingMachineView.new
machine.start
