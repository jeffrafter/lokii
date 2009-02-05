LOKII_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')) unless defined?(LOKII_ROOT)
$:.unshift(File.join(LOKII_ROOT, 'config'))
$:.unshift(File.join(LOKII_ROOT, 'lib'))
require 'init'