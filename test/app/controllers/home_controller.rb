class HomeController < ApplicationController

	skip_before_filter :login_required

	def show
		render :text => 'you are home.'
	end

end
