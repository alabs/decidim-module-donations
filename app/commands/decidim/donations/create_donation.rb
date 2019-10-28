# frozen_string_literal: true

module Decidim
  module Donations
    class CreateDonation < Rectify::Command
      def initialize(form)
        @form = form
      end

      def call
        return broadcast(:invalid) if @form.invalid?

        transaction do
          create_donation!
        end

        broadcast(:ok, @donation)
      end

      private

      def create_donation!
        params = {
          payload: @form.payload.to_json,
          payer_id: @form.payer_id,
          token: @form.token,
          email: @form.email,
          amount: @form.amount,
          component: @form.current_component
        }

        @donation = Donation.create!(params)
      end
    end
  end
end
