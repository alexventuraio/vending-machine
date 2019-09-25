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
		it 'xxxx' do
			expect {
				simulate_stdin('e', 'e', 'p', 'a1', 'n') do
					VendingMachineService.new.start
				end
			}.to output("").to_stdout
		end
	end

	xdescribe '.insert_money' do
		let(:vm) { VendingMachineService.new }

		before do
			$stdin = StringIO.new("a\n")
		end

		after do
			$stdin = STDIN
		end

		it "should increase balance in 0.01" do
			#expect(get_user_input).to be == 'a'
			#expect(@vm.insert_money()).to eq(0)
			#vm.stub(:step_load_money) {"e"}
			allow($stdin).to receive(:gets).and_return("one", "two", "three")

			pp $stdin.gets # => "one"
			pp $stdin.gets # => "two"
			pp $stdin.gets # => "three"
		end
	end

	xdescribe '#choose' do
		let(:vm) { VendingMachineService.new }

		it 'sets @type and @quantity according to user\'s input' do
			STDIN.stub(:gets) { 'xxxxxxxxxxx' }
			$stdin = StringIO.new('xxxxxxxxxxxxx')
			vm.insert_money
			binding.pry

			expect(subject.instance_variable_get(:@type)).to eq :type
			expect(subject.instance_variable_get(:@quantity)).to eq :quantity
		end
	end
end
