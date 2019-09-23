require './wallet'

RSpec.describe Wallet do
	describe '#initialize' do
		it 'should be a valid Wallet instance' do
			expect(subject).to be_an_instance_of(Wallet)
		end

		it 'should respond to attribute methods' do
			expect(subject.balance).to be_kind_of(Integer)
			expect(subject.balance).to eq(0)
		end
	end

	describe '.add' do
		denomination = [0.01, 0.05, 0.10, 0.25, 0.50, 1, 2]

		context 'only described coins' do
			described_class::VALID_DENOMINATIONS.each_with_index do |val, index|
				break if index = denomination.size

				it "shoul accept '#{val}' and '#{val.upcase}' as a valid coin of #{denomination[index]}" do
					subject.add(val)
					expect(subject.balance).to eq(denomination[index])
					subject.add(val.upcase)
					expect(subject.balance).to eq(denomination[index])
				end
			end
		end

		context 'only described notes' do
			described_class::VALID_DENOMINATIONS.each_with_index do |val, index|
				next if index < 5

				it "shoul accept '#{val}' and '#{val.upcase}' as a valid note of #{denomination[index]}" do
					subject.add(val)
					expect(subject.balance).to eq(denomination[index])
					subject.add(val.upcase)
					expect(subject.balance).to eq(denomination[index])
				end
			end
		end
	end
end
