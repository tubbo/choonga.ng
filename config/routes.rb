Choongang::Application.routes.draw do
  custom_controllers = {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_for :users, controllers: custom_controllers do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/signup' => 'devise/registrations#new'
    get '/profile' => 'devise/registrations#edit'
  end

  resources :comments, only: %w(index)

  resources :tags, only: %w(show) do
    resources :links, only: %w(index) do
      resources :comments, only: %w(index show)
    end
  end

  resources :links, except: %w(edit) do
    collection { get :latest }
    member do
      put :up, as: :up_vote
      put :down, as: :down_vote
    end

    resources :comments
  end

  root to: 'application#index'
end
