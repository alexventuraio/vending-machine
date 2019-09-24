require_relative '../lib/catalog'
require_relative '../lib/catalog_loader'
require_relative '../lib/product'

RSpec.describe Catalog do
	describe '#initialize' do
		context 'when no initial array is passed' do
			before(:each) do
				@catalog = Catalog.new
			end

			it 'should init with a default empty products catalog' do
				expect(@catalog.products.size).to eq(0)
			end
		end

		context 'when an initial array is passed' do
			before(:each) do
				@catalog = Catalog.new(CatalogLoader.load_products('./spec/test_products.csv'))
			end

			it 'should init with a default empty products catalog' do
				expect(@catalog.products.size).to eq(2)
			end

			it 'should have a valid Product instance' do
				expect(@catalog.products.first).to be_an_instance_of(Product)
			end
		end
	end
end
