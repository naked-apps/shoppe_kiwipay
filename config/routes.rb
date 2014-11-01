require 'shoppe/kiwipay/callback_constraint'

Rails.application.routes.draw do
  scope module: :shoppe do
    namespace :kiwipay do
      get 'pay/:order_token', to: 'payments#pay', as: 'payment'
      post '*callback', to: 'payments#process_callback', as: 'callback', constraints: Shoppe::Kiwipay::CallbackConstraint.new
    end
  end
end