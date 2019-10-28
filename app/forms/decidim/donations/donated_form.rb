# frozen_string_literal: true

module Decidim
  module Donations
    class DonatedForm < Decidim::Form
      attribute :token, String, default: nil
      attribute :payer_id, String, default: nil 
      attribute :amount, Float
      attribute :email, String
      attribute :payload, Hash

      validates :current_component, presence: true
      validates :current_gateway, presence: true
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
      alias gateway current_gateway

    end
  end
end
