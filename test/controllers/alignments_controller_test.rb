require 'test_helper'

class AlignmentsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@alignment = alignments(:one)
	end

	test "should get index" do
		get alignments_url
		assert_response :success
	end

#	test "should get new" do
#		get new_alignment_url
#		assert_response :success
#	end
#
#	test "should create alignment" do
#		assert_difference('Alignment.count') do
#			post alignments_url, params: { alignment: { chromosome: @alignment.chromosome, cigar: @alignment.cigar, flags: @alignment.flags, position: @alignment.position, reference: @alignment.reference, sequence: @alignment.sequence } }
#		end
#
#		assert_redirected_to alignment_url(Alignment.last)
#	end
#
#	test "should show alignment" do
#		get alignment_url(@alignment)
#		assert_response :success
#	end
#
#	test "should get edit" do
#		get edit_alignment_url(@alignment)
#		assert_response :success
#	end
#
#	test "should update alignment" do
#		patch alignment_url(@alignment), params: { alignment: { chromosome: @alignment.chromosome, cigar: @alignment.cigar, flags: @alignment.flags, position: @alignment.position, reference: @alignment.reference, sequence: @alignment.sequence } }
#		assert_redirected_to alignment_url(@alignment)
#	end
#
#	test "should destroy alignment" do
#		assert_difference('Alignment.count', -1) do
#			delete alignment_url(@alignment)
#		end
#
#		assert_redirected_to alignments_url
#	end
end
