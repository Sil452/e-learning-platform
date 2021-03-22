Rails.application.routes.draw do
  resources :lessons
  devise_for :users
    root "static_pages#landing_page"
    
    get "static_pages/activity"
    resources :users, only: [:index, :edit, :show, :update]
    resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
