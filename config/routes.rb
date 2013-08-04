Choongang::Application.routes.draw do
  resources :tags, only: %w(show) do
    resources :links, only: %w(index)
  end

  resources :links, only: %w(index show create destroy)

  root to: 'application#index'
end
