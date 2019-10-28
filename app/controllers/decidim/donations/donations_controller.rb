# frozen_string_literal: true


module Decidim
  module Donations
    class DonationsController < Decidim::Donations::ApplicationController
      include FormFactory
      def index
        @form = form(DonationForm).from_params({})
      end

      def thanks
        @form = form(DonationForm).from_params(params, current_component: current_component)
        CreateDonation.call(@form) do
          on(:ok) do
            flash[:notice] = "Se pudo!"
          end

          on(:invalid) do
            flash[:alert] = "Error"
          end
        end
        redirect_to donations_path
      end

      def create
        @form = form(DonationForm).from_params(params)
        payment = @form.gateway.setup_purchase(
          @form.full_amount,
          ip: request.remote_ip,
          return_url: url_for(thanks_donation_url(current_component)),
          cancel_return_url: "http://local.mywebdomain.com:3000/seeyouagain",
          currency: "USD",
          allow_guest_checkout: true,
          items: [{
            name: @form.title,
            description: @form.description,
            quantity: "1",
            number: "1",
            amount: @form.full_amount,
            category: "Digital"
          }]
        )
        redirect_to @form.gateway.redirect_url_for(payment.token)
      end
    end
  end
end
