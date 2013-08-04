Choongang::Application.routes.draw do
  devise_for :users

  resources :tags, only: %w(show) do
    resources :links, only: %w(index)
  end

  resources :links, except: %w(edit) do
    collection { get :newest }
  end

  root to: 'application#index'
end
