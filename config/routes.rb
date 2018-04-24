Rails.application.routes.draw do
  devise_for :users, only: :sessions, controllers: { sessions: 'admin/sessions' }

  root 'home#index'

  namespace :admin do
    root 'dashboard#index'
  end
end
