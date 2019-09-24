require 'pry'
require_relative '../lib/vending_machine_view_helper'
require_relative '../lib/catalog'
require_relative '../lib/catalog_loader'
require_relative '../lib/product'
require_relative '../lib/shopping_cart'
require_relative '../lib/wallet'

class VendingMachineService
	include VendingMachineViewHelper

	attr_reader :catalog, :shopping_cart, :wallet

	def initialize(catalog_file = 'products.csv')
		@catalog = Catalog.new(CatalogLoader.load_products(catalog_file))
		@shopping_cart = ShoppingCart.new
		@wallet = Wallet.new
	end

	def start
		loop do
			print "> "
			command = $stdin.gets.chomp

			if command == 'exit'
				puts '*********'
				break
			else
				puts "echo: \"#{command}\""
			end
		end
	end

	def startx
		render_view_welcome_msg
		render_view_products_menu(@catalog)
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

	def step_anything_else
		render_view_anything_else_msg

		user_input = get_user_input

		if user_input.downcase == 'y'
			step_select_products
		else
			render_view_vended_products_msg(@shopping_cart.items)
			render_view_refund_msg(@wallet.balance - @shopping_cart.get_total)
		end
	end

	def validate_balance
		result = @wallet.balance - @shopping_cart.get_total

		case
		when result == 0
			render_view_vended_products_msg(@shopping_cart.items)
			render_view_refund_msg(@wallet.balance - @shopping_cart.get_total)
		when result < 0
			render_view_insufficient_funds_msg(result.abs)
			step_load_money
			validate_balance
		when result > 0
			step_anything_else
		end
	end

	def search_product_by_code(code)
		code.strip!
		selected_product = @catalog.products.find do |product|
			product.code.downcase.eql?(code.downcase)
		end
	end

	def step_select_products
		render_view_select_product_promt
		user_input = get_user_input

		product = search_product_by_code(user_input)

		if product
			@shopping_cart.add_item(product)
			validate_balance
		else
			render_view_products_menu(@catalog)
			render_view_error_msg('Unknown product code!')
			step_select_products
		end
	end

	def step_load_money
		render_view_money_menu(@wallet.balance)

		while user_input = get_user_input # loop while getting user input
			if Wallet::VALID_DENOMINATIONS.include?(user_input)
				@wallet.add(user_input)
			elsif @wallet.balance > 0 && user_input.eql?('p')
				break
			elsif @wallet.balance > 0 && user_input.eql?('x')
				render_view_refund_msg(@wallet.balance - @shopping_cart.get_total)
				@refund = true
				break
			else
				render_view_error_msg('Unknown command!')
			end

			render_view_money_menu(@wallet.balance)
		end
	end

	def get_user_input
		$stdin.gets.chomp
	end
end

#machine = VendingMachineService.new
#machine.start
require_relative '../spec/support/io_test_helpers'
## Make `simulate_stdin` method a class method by adding `self`
IoTestHelpers.simulate_stdin('e', 'e', 'p', 'exit') do
	VendingMachineService.new.start
end
