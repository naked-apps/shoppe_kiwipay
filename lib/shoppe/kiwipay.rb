require 'shoppe/kiwipay/version'
require 'shoppe/kiwipay/engine'

require 'shoppe/kiwipay/order_extensions'

require 'shoppe/kiwipay/errors/account_name_undefined'

module Shoppe
  module Kiwipay

    class << self

      attr_accessor :configuration

      def account_name
        Shoppe.settings.kiwipay_account_name
      end

      def setup
        # Set the configuration which we would like
        Shoppe.add_settings_group :kiwipay, [:kiwipay_account_name]
      end

      def configure
        self.configuration ||= Shoppe::Kiwipay::Configuration.new
        yield(configuration)
      end

    end

    class Configuration
      attr_accessor :callback_path, :order_not_found_route, :return_after_payment_route

      def initialize
        @callback_path = 'payment'
        @order_not_found_route = 'root'
        @return_after_payment_route = 'root'
      end
    end

  end
end