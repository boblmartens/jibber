ActionController::Routing::Routes.draw do |map|
  map.resources :comments

	map.root :controller => 'posts', :action => 'index' 
	map.resources :posts, :has_many => :comments
  
	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
