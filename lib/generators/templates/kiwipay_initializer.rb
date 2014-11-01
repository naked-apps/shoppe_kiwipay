Shoppe::Kiwipay.configure do |config|
  # This is the final path component of the Kiwipay 
  # callback URL, visited by Kiwipay after a payment.
  # It is prefixed with /kiwipay/ automatically.  
  # You must contact Kiwipay support and give them
  # this URL or payments won't be detected.  
  # No trailing slash required.  
  #
  # The default is 'payment'
  #
  # config.callback_path = 'payment'

  # This is the route used for a redirect
  # when an order cannot be found after a request is
  # made to pay this order via kiwipay. This is usually
  # something like checkout, but needs to match with the
  # routes you've set in your routes.rb file.
  #
  # The default is 'root'
  #
  # config.order_not_found_route = 'checkout'

  # This is the route used to return the buyer
  # to your shop after they've made a payment with kiwipay.
  # This is usually some sort of order_status, which
  # will be called with the order ID or token (order ID
  # if sandboxed, or token if production) and
  # checks the order for success / failure, but needs
  # to match with the routes you've set in 
  # your routes.rb file.
  #
  # The default is 'root'
  #
  # config.return_after_payment_route = 'order_status'
end