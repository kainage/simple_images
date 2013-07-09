Dummy::Application.routes.draw do
	resources :articles do
		resources :simple_images, shallow: true, only: [:create, :update, :destroy]
	end
end
