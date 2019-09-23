require './shopping_cart'
require './product'

RSpec.describe ShoppingCart do
	describe '#initialize' do
		it 'should be a valid ShoppingCart instance' do
			expect(subject).to be_an_instance_of(ShoppingCart)
		end

		it 'should respond to attribute methods' do
			expect(subject.items).to be_kind_of(Array)
			expect(subject.items.size).to eq(0)
			expect(subject.get_total).to eq(0)
		end
	end

	describe '.add_item' do
		it 'should increase items array size in 1' do
			subject.add_item(Product.new('Chocolate Bar', 'A1', '4'))
			expect(subject.items.size).to eq(1)
		end
	end

	describe '.get_total' do
		it 'should return the sum of the price attribute of each items' do
			subject.add_item(Product.new('Chocolate Bar', 'A1', '4'))
			subject.add_item(Product.new('Chips', 'A2', '8'))
			expect(subject.get_total).to eq(12)
		end
	end
end
