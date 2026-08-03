Rails.application.routes.draw do
  resources :todos do
    member do
      patch :toggle
    end
  end

  resources :posts

  root "todos#index"
end
