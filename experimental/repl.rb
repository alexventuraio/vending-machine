class Repl
	def start
		loop do
			print "> "
			command = $stdin.gets.chomp

			if command == "exit"
				puts "end of games..."
				break
			else
				puts "echo: \"#{command}\""
			end
		end
	end
end

#Repl.new.start
#require_relative '../spec/support/io_test_helpers'
# Make `simulate_stdin` method a class method by adding `self`
#IoTestHelpers::simulate_stdin('command1 arg', 'otherCommand 1 2 3', 'exit') do
	#Repl.new.start
#end
