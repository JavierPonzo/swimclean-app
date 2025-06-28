Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "areas#index"
  resources :areas, only: [:index, :create]
  resources :reports, only: [:create]

end
