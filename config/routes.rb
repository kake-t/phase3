Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users
  get '/', to: 'pictures#top'
end
