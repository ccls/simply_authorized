ActionController::Routing::Routes.draw do |map|

	map.resources :users, :only => [] do |user| 
		user.resources :roles, :only => [:update,:destroy]
	end

end
