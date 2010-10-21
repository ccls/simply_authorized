ActionController::Routing::Routes.draw do |map|

#	map.resources :users, :only => [:destroy,:show,:index],
#		:collection => { :menu => :get } do |user|
	map.resources :users, :only => [] do |user|
		user.resources :roles, :only => [:update,:destroy]
	end

end
