require 'shoppe/kiwipay/routing_constraints'

Shoppe::Engine.routes.draw do
  get 'kiwipay/*callback' => 'payments#process_callback', as: 'kiwipay_callback', constraints: Shoppe::Kiwipay::CallbackConstraint.new
end