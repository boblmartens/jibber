ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resources :comments
  map.resources :tags

	map.root :controller => 'posts', :action => 'index' 
	map.resources :posts, :has_many => :comments
  
  map.resource :session
  
	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
