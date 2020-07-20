Rails.application.routes.draw do 
  root to: 'home#index'
  get 'about' => 'home#about', as: :about
  get 'data' => 'home#data', as: :data
  post 'pledges' => "pledges#create", as: :pledges

  ## Admin routes
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'vouchers', to: 'vouchers#index'
  get 'voucher/:id', to: 'vouchers#show', as: :voucher
  post 'vouchers/create', to: 'vouchers#create', as: :voucher_create
  patch 'voucher/send_message/:id', to: 'vouchers#send_message', as: :send_message
  post 'voucher/:id', to: 'vouchers#add_expense', as: :create_expense
  patch 'voucher/:id', to: 'vouchers#update', as: :voucher_update
end
