Rails.application.routes.draw do
  get 'vouchers', to: 'vouchers#index'
  get 'voucher/:id', to: 'vouchers#show', as: :voucher
  patch 'voucher/:id', to: 'vouchers#update', as: :voucher_update
  post 'voucher/:id', to: 'vouchers#add_expense', as: :create_expense

  root to: 'home#index'
  get 'about' => 'home#about', as: :about
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
