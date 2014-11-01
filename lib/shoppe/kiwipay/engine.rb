module Shoppe
  module Kiwipay
    class Engine < Rails::Engine

      initializer "shoppe.kiwipay.initializer" do
        Shoppe::Kiwipay.setup
      end

      config.to_prepare do
        Shoppe::Order.send :include, Shoppe::Kiwipay::OrderExtensions
      end

    end
  end
end
