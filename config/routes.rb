ActionController::Routing::Routes.draw do |map|

	map.resources :users, :only => [:destroy,:show,:index],
		:collection => { :menu => :get } do |user|
		user.resources :roles, :only => [:update,:destroy]
	end

	map.resource :home, :only => :show
	map.root :controller => :home, :action => :show

end
