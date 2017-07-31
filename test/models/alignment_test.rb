require 'test_helper'

class AlignmentTest < ActiveSupport::TestCase

	test "should create" do
		assert_difference('Alignment.count',1)do
			Alignment.create
		end
	end

end
