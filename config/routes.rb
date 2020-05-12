Rails.application.routes.draw do
  root to: 'home#index'
  get 'about' => 'home#about', as: :about
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
