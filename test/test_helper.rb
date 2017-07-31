require File.expand_path('../../config/environment', __FILE__)



#	Rails 5.1 does not add these lines and autotest then uses the development database?
#ENV['RAILS_ENV'] ||= 'test'
#require File.expand_path('../../config/environment', __FILE__)




require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end



require 'mocha/mini_test'
