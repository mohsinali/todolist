Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end
end
