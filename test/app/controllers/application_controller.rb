class ApplicationController < ActionController::Base
	#	overwrite method in ccls engine
	def build_menu_js
	end


	def redirections
		@redirections ||= HashWithIndifferentAccess.new({
			:not_be_user => {
				:redirect_to => user_path(current_user)
			}
		})
	end

end
