require File.dirname(__FILE__) + '/../spec_helper'

describe :lokii, :logger do  

  # Omit puts calls when testing the logger, use a nonce stub instead of debug
  before(:each) do
    Lokii::Logger.logger = nil
    Logger.stub!(:nonce).and_return(true)
    Kernel.stub!(:puts).and_return(true)
  end
 
  it "should have a single logger instance" do
    logger = Lokii::Logger.logger
    logger.should be_nil
    Lokii::Logger.nonce "The hum of a low plane skywriting"
    logger = Lokii::Logger.logger
    logger.should_not be_nil
    Lokii::Logger.nonce "goodnight, goodnight"
    Lokii::Logger.logger.should == logger
  end
  
  it "should detect if it is being run as a daemon" do
    Lokii::Logger.should_not be_daemon
    LOKII_DAEMON = true
    Lokii::Logger.should be_daemon
  end
  
  it "should send put messages to console if not being run as a daemon"
  it "should setup the logger for every method"
  it "should reopen the files if it is being run as a daemon"
end