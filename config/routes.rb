Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  resources :users
  resources :clients do
    collection do
      get :search
      post :import
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "clients#search"
end
