Rails.application.routes.draw do 
  root to: 'home#index'
  get 'about' => 'home#about', as: :about
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'vouchers', to: 'vouchers#index'
  get 'voucher/:id', to: 'vouchers#show', as: :voucher
  post 'vouchers/create', to: 'vouchers#create', as: :voucher_create
  patch 'voucher/send_message/:id', to: 'vouchers#send_message', as: :send_message
  post 'voucher/:id', to: 'vouchers#add_expense', as: :create_expense
  patch 'voucher/:id', to: 'vouchers#update', as: :voucher_update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
