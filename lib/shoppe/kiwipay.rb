require 'shoppe/kiwipay/version'
require 'shoppe/kiwipay/engine'

module Shoppe
  module Kiwipay

    class << self

      def callback_path_component
        Shoppe.settings.kiwipay_callback_path_component
      end

      def setup
        # Set the configuration which we would like
        Shoppe.add_settings_group :kiwipay, [:kiwipay_callback_path_component]
      end

    end
  end
end