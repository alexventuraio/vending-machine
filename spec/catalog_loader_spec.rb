require_relative '../lib/catalog_loader'
require_relative '../lib/product'

RSpec.describe CatalogLoader do
	describe '.load_products' do
		it 'should respond to :load_products' do
			expect(described_class).to respond_to(:load_products)
		end

		context 'when testing the load_products class method' do
			let(:product_1) { Product.new('Water', 'C1', '1.25') }
			let(:product_2) { Product.new('Soda', 'C3', '2.99') }
			let(:dummy_catalog) { [product_1, product_2] }

			before do
				allow(described_class).to receive(:load_products)
				.with('test_products.csv').and_return(dummy_catalog)
			end

			it 'loads a csv file and returns an array' do
				catalog = described_class.load_products('test_products.csv')
				expect(catalog.size).to eq(2)
			end
		end
	end
end
