require File.join(File.dirname(__FILE__), '..', 'test_helper')

require 'matchy'

class ILoveYouHandlerTest < Test::Unit::TestCase
  context "Basic handling" do
    before do
      # Nothing to do, okay?
    end

    describe "I Love You Handler" do
      it "should do things" do
        ILoveYouHandler.new.should be(nil)
      end
    end
  end  
end    