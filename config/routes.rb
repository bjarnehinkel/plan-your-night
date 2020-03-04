Rails.application.routes.draw do
  devise_for :users
  root to: 'nights#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :venues, except: [:index, :show] do
    resources :favourites, only: :create
  end

  resources :nights, only: [:new, :create] do
    resources :venues, only: [:index, :show] do
      collection do
        get 'clubs'
      end
    end
  end
  get '/users/:id', to: 'users#show', as: :user
end
