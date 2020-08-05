# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders, except: %i[destroy edit show]

  put 'orders/:id', to: 'orders#update', as: :update_order

  get 'orders/filter/:filter_param', to: 'orders#index', as: 'filter_orders'

  get 'orders/controll/:order_control', to: 'orders#index', as: 'order_control'

  root to: 'orders#index'
end
