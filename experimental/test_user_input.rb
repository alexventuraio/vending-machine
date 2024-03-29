require 'minitest/spec'
require 'minitest/autorun'

def get_action
	gets.chomp
end

def welcome_user
	puts "Welcome to Jamaica and have a nice day!"
	action = get_action
	return "Required action was #{action}."
end

describe "Welcoming users" do
	before do
		def get_action
			"test string"
		end
	end

	it "should work" do
		welcome_user.must_equal "Required action was test string."
	end
end
