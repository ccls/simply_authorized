module Authorized
#	predefined namespace
end
require 'ruby_extension'
require 'rails_helpers'
require 'acts_as_list'
require 'calnet_authenticated'

HTML::WhiteListSanitizer.allowed_attributes.merge(%w(
	id class style
))

require 'authorized/core_extension'
require 'authorized/user_model'
require 'authorized/authorization'
require 'authorized/helper'
require 'authorized/controller'
require 'authorized/resourceful_controller'
require 'authorized/permissive_controller'

if !defined?(RAILS_ENV) || RAILS_ENV == 'test'
	require 'active_support'
	require 'active_support/test_case'
	require 'factory_girl'
	require 'assert_this_and_that'
	require 'authorized/factories'
	require 'authorized/factory_test_helper'
	require 'authorized/pending'
end
