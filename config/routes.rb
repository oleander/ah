Rails.application.routes.draw do
  resources :partners, only: [:show]
  resources :requests, only: [] do
    resources :partners, only: [:index]
  end
end
