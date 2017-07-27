Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meetups do
    resources :comments
  end

     namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :create, :show, :update, :destroy]
      end
    end

  root "meetups#index"

end
