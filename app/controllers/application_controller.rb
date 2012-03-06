class ApplicationController < ActionController::Base

	before_filter :login_required

#	helper_method :current_user, :logged_in?

	helper :all # include all helpers, all the time

	# See ActionController::RequestForgeryProtection for details
	protect_from_forgery

	def logged_in?
		!current_user.nil?
	end

	def current_user_required
		unless logged_in?
			access_denied("goodbye","/some_fake_login_path")
		end
	end
	alias_method :login_required, :current_user_required

	def current_user
		@current_user ||= if( session && session[:uid] )
				#	if the user model hasn't been loaded yet
				#	this will return nil and fail.
				User.find_by_uid(session[:uid])
			else
				nil
			end
	end

protected

	#	used in roles_controller
	def may_not_be_user_required
		current_user.may_not_be_user?(@user) || access_denied(
			"You may not be this user to do this", user_path(current_user))
	end

end
