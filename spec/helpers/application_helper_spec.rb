require 'spec_helper'

describe ApplicationHelper do
	describe "full title" do
		it "should contain full title" do
			full_title("foo").should =~ / | foo/
		end
		
		it "should contain base title" do
			full_title("").should =~ /Creu Roja/
		end
		
		it "should not have a |" do
			full_title("").should_not =~ /\|/
		end
	end
end