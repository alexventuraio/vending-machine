require_relative 'vending_machine_service'
require_relative '../spec/support/io_test_helpers'
require_relative '../lib/catalog'
require_relative '../lib/catalog_loader'
require_relative '../lib/product'
require_relative '../lib/shopping_cart'
require_relative '../lib/wallet'

def get_user_input
  $stdin.gets.chomp
end

RSpec.configure do |c|
  c.include IoTestHelpers
end

RSpec.describe VendingMachineService do
	describe '#initialize' do
		it 'should be a valid VendingMachineService instance' do
			expect(subject).to be_an_instance_of(VendingMachineService)
		end

		it 'should initialize with a default catalog' do
			expect(subject.catalog.products.size).to eq(12)
		end

		it 'should initialize with an empty shopping cart' do
			expect(subject.shopping_cart.items.size).to eq(0)
		end

		it 'should initialize with a wallet balance of 0' do
			expect(subject.wallet.balance).to eq(0)
		end
	end

	describe '.start' do
		it 'should follow the process to buy a chocolate sucessfully' do
			expect {
				simulate_stdin('e', 'e', 'p', 'a1', 'n') do
					described_class.new(silent_mode: true).start
				end
			}.to output("\n\nYour products are:\n- Chocolate bar\n\nYour change is: 0.25\n").to_stdout
		end
	end
end
