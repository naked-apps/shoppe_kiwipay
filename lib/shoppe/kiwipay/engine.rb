module Shoppe
  module Kiwipay
    class Engine < Rails::Engine
      
      initializer "shoppe.kiwipay.initializer" do
        Shoppe::Kiwipay.setup
      end
      
    end
  end
end
