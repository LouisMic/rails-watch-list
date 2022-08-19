Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :movies, only: %i[index show]
  resources :lists, only: %i[new index create] do
    resources :bookmarks, only: %i[new create]
  end
  get 'lists/:id', to: 'lists#show', as: :list
  delete 'lists/:id', to: 'lists#destroy', as: :delete_list
end
