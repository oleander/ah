Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # TODO: Limit
  resources :partners
  resources :requests do
    resources :partners
  end
end
