Rails.application.routes.draw do
  get 'kiwipay/*callback' => 'payments#process_callback', as: 'kiwipay_callback', constraints: KiwipayCallbackConstraint.new
end