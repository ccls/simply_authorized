module Authorized
#	predefined namespace
end
require 'active_support'
require 'ruby_extension'
require 'rails_helpers'
require 'acts_as_list'
require 'calnet_authenticated'

HTML::WhiteListSanitizer.allowed_attributes.merge(%w(
	id class style
))

%w{models controllers}.each do |dir|
	path = File.expand_path(File.join(File.dirname(__FILE__), '../app', dir))
	ActiveSupport::Dependencies.autoload_paths << path
	ActiveSupport::Dependencies.autoload_once_paths << path

	#	I don't know why I have to do this here
	#	and nowhere else.  Photos can't find 'role'
	#	when needed?
#	$: << path
end

require 'authorized/core_extension'
require 'authorized/user_model'
require 'authorized/authorization'
require 'authorized/helper'
require 'authorized/controller'
require 'authorized/resourceful_controller'
require 'authorized/permissive_controller'

if !defined?(RAILS_ENV) || RAILS_ENV == 'test'
	require 'active_support/test_case'
	require 'factory_girl'
	require 'assert_this_and_that'
	require 'authorized/factories'
	require 'authorized/factory_test_helper'
	require 'authorized/pending'
end

ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))
