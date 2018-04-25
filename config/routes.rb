Rails.application.routes.draw do
  devise_for :users, only: :sessions, controllers: { sessions: 'admin/sessions' }

  root 'home#index'

  namespace :admin do
    root 'dashboard#index'

    namespace :currencies, only: [] do
      resource :forced, only: [:update], controller: 'forced'
    end
  end

  namespace :api do
    resources :currencies, only: [:index]
  end
end
