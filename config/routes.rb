Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  get "/users/:id", to: "users#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'questions#index'
  # get "/questions", to: "questions#index"
  # get "/questions/new", to: "questions#new"
  # post "/questions", to: "questions#create"
  # get "/questions/:id", to: "questions#show"

  # get "/questions/:id/edit", to: "questions#edit"
  # patch "/questions/:id", to: "questions#update"
  # delete "/questions/:id", to: "questions#destroy"
  resources :questions do
    resource :answers, only: [:create, :edit, :update]
  end
  
  resources :articles do
    collection do
      get 'search' => 'articles#search'
    end
  end
end
