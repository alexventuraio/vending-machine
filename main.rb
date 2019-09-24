require './lib/vending_machine'

# Verify if a different CSV file was given as argument
csv_file = ARGV[0]

if csv_file
	machine = VendingMachine.new(csv_file)
else
	machine = VendingMachine.new
end

machine.start
