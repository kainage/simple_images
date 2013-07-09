Dummy::Application.routes.draw do
	resources :articles do
		resources :simple_images
	end
end
