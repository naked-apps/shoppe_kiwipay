module Shoppe
  module Kiwipay
    class CallbackConstraint
      def matches?(request)
        Shoppe::Kiwipay.configuration.callback_path == request.path_parameters[:callback]
      end
    end
  end
end