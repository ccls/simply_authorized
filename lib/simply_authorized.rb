module SimplyAuthorized
#	predefined namespace
end
require 'active_support'
require 'ruby_extension'
require 'simply_helpful'
require 'acts_as_list'
require 'calnet_authenticated'

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

if !defined?(RAILS_ENV) || RAILS_ENV == 'test'
	require 'active_support/test_case'
	require 'factory_girl'
	require 'simply_testable'
	require 'simply_authorized/factories'
	require 'simply_authorized/factory_test_helper'
	require 'simply_authorized/pending'
end

ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))
