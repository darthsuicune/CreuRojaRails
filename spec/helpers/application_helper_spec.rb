require 'spec_helper'

describe ApplicationHelper do
  it "should contain full title" do
    full_title("foo").should =~ / | foo/
  end
  
  it "should contain base title" do
    full_title("").should =~ /Creu Roja/
  end
end