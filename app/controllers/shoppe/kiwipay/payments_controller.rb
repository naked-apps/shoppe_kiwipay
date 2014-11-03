module Shoppe
  module Kiwipay
    class PaymentsController < ApplicationController

      skip_before_action :verify_authenticity_token, only: [:pay, :process_callback]
      skip_filter :login_required

      def process_callback
        ensure_callback_params!
        permitted = params.permit(:id, :custom, :reference, :amount, :status, :name, :email, address: [:street, :region, :city, :zip, :country])
        order = Shoppe::Order.find_by_token!(permitted[:custom])
        # Only received orders can have payments against them
        # as they're changed from received to accepted after payment
        if order.status == 'received'
          if order.create_kiwipay_payment(permitted)
            order.accept!
            head :ok, content_type: "text/html"
          else
            head :not_acceptable, content_type: "text/html"
          end
        else
          head :not_acceptable, content_type: "text/html"
        end
      end

      def pay
        unless order = Shoppe::Order.find_by_token(params[:order_token])
          order_not_found_path = Rails.application.routes.url_helpers.send("#{Shoppe::Kiwipay.configuration.order_not_found_route}_url")
          redirect_to order_not_found_path, alert: "Sorry, we couldn't actually find your order.  Please try again."
          return
        end

        payment_params = order.kiwipay_payment_parameters
        payment_params[:return_url] = return_url(order.token)
        redirect_to "#{payment_url}?#{payment_params.to_query}"
      end

      private

      def ensure_callback_params!
        params.require(:custom)
        params.require(:id)
        params.require(:reference)
        params.require(:amount)
        params.require(:status)
        params.require(:name)
        params.require(:email)
        params.require(:address)
      end

      def payment_url
        account_name = Shoppe.settings.kiwipay_account_name
        raise Shoppe::Kiwipay::Errors::AccoutNameUndefined unless account_name.present?
        if Rails.env.production?
          "https://kiwipay.com/pay/#{account_name}"
        else
          "http://sandbox.kiwipay.com/pay/#{account_name}"
        end        
      end

      def return_url(identifier)
        route = Shoppe::Kiwipay.configuration.return_after_payment_route
        identifier_key = Rails.application.routes.named_routes[route].required_parts.first
        Rails.application.routes.url_helpers.send("#{route}_url", host: request.host, identifier_key => identifier)
      end

    end
  end
end