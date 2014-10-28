module Shoppe
  module Kiwipay
    class CallbackConstraint
      def matches?(request)
        Shoppe::Kiwipay.callback_path_component == request.path_components[:callback]
      end
    end
  end
end