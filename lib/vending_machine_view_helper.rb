module VendingMachineViewHelper
	def render_view_vended_products_msg(items, total)
		puts "\n\nYour products are:"
		items.each do |item|
			puts "- #{item.name}"
		end
		render_view_refund_msg(total)
	end

	def render_view_refund_msg(total)
		puts "\nYour change is: #{(total).round(2)}"
	end

	def render_view_anything_else_msg
		puts "\nWould like to purchase anything else?"
		puts "y=YES \t\t n=NO"
		print "> "
	end

	def render_view_insufficient_funds_msg(amount = 0)
		puts "\n########## Error: Not enough funds! ##########"
		puts "\n########## You need to add #{amount}! ##########"
	end

	def render_view_select_product_promt
		puts '-' * 90
		print "\n\nEnter product code > "
	end

	def render_view_error_msg(error_msg)
		puts "\n########## Error: #{error_msg} ##########"
	end

	def render_view_money_menu(balance)
		puts "\n\nCoins accepted: a=¢1, b=¢5, c=¢10, d=¢25, e=¢50 \tNotes accepted: f=$1, g=$2"
		if balance > 0
			puts "Balance: $#{balance.round(2)} \t\tp=Select product \t\tx=Candel & Refund"
		end
		print 'Insert coin > '
	end

	def render_view_welcome_msg
		puts "\n\n===== Welcome to Vending Machine ====="
	end

	def render_view_products_menu(catalog)
		puts "\n********** This is my menu ***********"

		catalog.products.each do |product|
			puts "#{product.code} - $#{product.price} - #{product.name}"
		end

		puts "**************************************"
	end
end