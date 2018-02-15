require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def check_logged_in
		!current_user.nil?
  end

end
