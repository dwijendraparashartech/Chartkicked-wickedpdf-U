Rails.application.routes.draw do
  resources :orders
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # get 'order_records', to: "orders#order_records"
  controller :home do
    get :convert
    get :pdf
  end
end
