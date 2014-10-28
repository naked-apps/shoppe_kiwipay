class KiwipayCallbackConstraint
  def matches?(request)
    Shoppe::Kiwipay.callback_path_component == request.path_components[:callback]
  end
end