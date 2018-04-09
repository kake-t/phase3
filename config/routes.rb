Rails.application.routes.draw do
  resources :favorites, only: %i[create destroy]
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users
  get '/', to: 'pictures#top'
end
