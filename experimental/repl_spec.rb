require_relative 'repl'
require_relative '../spec/support/io_test_helpers'

RSpec.configure do |c|
  c.include IoTestHelpers
end

RSpec.describe Repl do
	describe '.start' do
		it "prints an exit message on the exit command" do
			expect {
				simulate_stdin('exit') do
					Repl.new.start
				end
			}.to output("> end of games...\n").to_stdout
		end
	end
end
