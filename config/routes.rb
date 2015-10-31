Blog::Application.routes.draw do
	get "welcome/homepage"
	get "users/signup", to: 'users#new'
	get "users/login"
	get "users/logout"
	get "users/forgot_password"
	get "users/change_password", to: 'users#change_password'
	get "welcome/index"
	get "log_out" => "sessions#destroy"
	get "log_in" => "sessions#new"
	get 'profile/:login', to: 'users#show', as: :user
	post 'users/:id/edit', to: 'users#update'
	root 'welcome#frontpage'
	resources :streams
	resources :sessions
	resources :users do
		resources :comments
		resources :posts
	end
	resources :posts do
		resources :comments
	end
	match '*path' => redirect('/'), via: :get
end
