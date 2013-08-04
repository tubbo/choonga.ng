Choongang::Application.routes.draw do
  custom_controllers = {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_for :users, controllers: custom_controllers do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/signup' => 'devise/registrations#new'
    get '/profile' => 'users/registrations#show'
  end

  resources :tags, only: %w(show) do
    resources :links, only: %w(index)
  end

  resources :links, except: %w(edit) do
    collection { get :newest }
  end

  root to: 'application#index'
end
