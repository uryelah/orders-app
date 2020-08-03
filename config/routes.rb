Rails.application.routes.draw do
  resources :orders, except: [:destroy]

  get 'orders/filter/:filter_param', to: 'orders#index', as: 'filter_orders'

  get 'orders/controll/:order_control', to: 'orders#index', as: 'order_control'
end
