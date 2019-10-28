# frozen_string_literal: true

require "active_merchant"

module Decidim
  module Donations
    module Providers
      # Paypal payments implementation
      class PayPal
        attr_reader :gateway

        def initialize(login, password, signature)
          ActiveMerchant::Billing::Base.mode = :test
          paypal_options = {
            login: login,
            password: password,
            signature: signature
          }
          @gateway = ActiveMerchant::Billing::PaypalDigitalGoodsGateway.new(paypal_options)
        end

        def payment(options)
          gateway
        end
      end
    end
  end
end
