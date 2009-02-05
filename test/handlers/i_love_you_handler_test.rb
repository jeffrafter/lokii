require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ILoveYouHandlerTest < Test::Unit::TestCase
  context "Basic handling" do
    setup do
      # Nothing to do, okay?
    end

    should "do things" do
      assert_not_nil ILoveYouHandler.new 
    end
  end  
end    