require './lib/product'

RSpec.describe Product do
	describe '#initialize' do
		subject { Product.new('Product 1', 'A1', '12') }

		it 'should be a valid Product instance' do
			expect(subject).to be_an_instance_of(Product)
		end

		it 'should respond to attribute methods' do
			expect(subject.name).to eq('Product 1')
			expect(subject.code).to eq('A1')
			expect(subject.price).to eq(12.0)
		end
	end
end
