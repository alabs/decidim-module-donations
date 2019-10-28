# frozen_string_literal: true

module Decidim
  module Donations
    class DonationForm < Decidim::Form
      attribute :title, String
      attribute :description, String
      attribute :amount, Integer, default: 5
      attribute :subscription, Boolean, default: false
      attribute :token, String, default: nil
      attribute :payer_id, String, default: nil 
      attribute :amount, Float
      attribute :email, String
      attribute :payload, Hash

      validates :current_component, presence: true
      validates :token, :payer_id, presence: true
      validate :paypal

      def paypal
        self.amount = order.details["OrderTotal"].to_f
        self.email = order.info["Payer"]
        self.payload = order
        return if order.success?
        errors.add(:paypal, "not success")
      end
      
      def order
        gateway.details_for(token)
      end

      alias component current_component

      validates :amount, numericality: {
        greater_than_or_equal_to: 5,
        less_than_or_equal_to: 1_000
      }

      def full_amount
        amount * 100
      end

      def gateway
        Decidim::Donations::Providers::PayPal.new(
          component.settings.paypal_username,
          component.settings.paypal_password,
          component.settings.paypal_signature).gateway
      end
    end
  end
end
