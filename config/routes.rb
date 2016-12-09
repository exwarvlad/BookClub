Rails.application.routes.draw do
  devise_for :users

  resources :books do
    resources :comments, only: [:create, :destroy]

    post :show, on: :member
  end

  root "books#index"
end
