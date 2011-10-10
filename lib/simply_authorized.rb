module SimplyAuthorized
#	predefined namespace
end
require 'active_support'

gem 'ccls-ruby_extension'
require 'ruby_extension'

gem 'ccls-simply_helpful'
require 'simply_helpful'

require 'acts_as_list'

require 'action_controller'	#	loads HTML
HTML::WhiteListSanitizer.allowed_attributes.merge(%w(
	id class style
))

%w{models controllers}.each do |dir|
	path = File.expand_path(File.join(File.dirname(__FILE__), '../app', dir))
	ActiveSupport::Dependencies.autoload_paths << path
	ActiveSupport::Dependencies.autoload_once_paths << path
end

require 'simply_authorized/core_extension'
require 'simply_authorized/user_model'
require 'simply_authorized/authorization'
require 'simply_authorized/helper'
require 'simply_authorized/controller'
require 'simply_authorized/resourceful_controller'
require 'simply_authorized/permissive_controller'

if defined?(Rails) && Rails.env == 'test' && Rails.class_variable_defined?("@@configuration")
	require 'active_support/test_case'
	require 'factory_girl'
	require 'simply_authorized/factories'
	require 'simply_authorized/factory_test_helper'
#	else
#		running a rake task
end

ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))
