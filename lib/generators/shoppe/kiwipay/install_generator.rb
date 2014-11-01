module Shoppe
  module Kiwipay
    module Generators
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path("../../../templates", __FILE__)
        desc "Creates Kiwipay initializer for your application"

        def copy_initializer
          template "kiwipay_initializer.rb", "config/initializers/kiwipay.rb"

          puts "Install complete!"
        end
      end
    end
  end
end