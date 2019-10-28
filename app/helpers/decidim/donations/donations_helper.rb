# frozen_string_literal: true

module Decidim
  module Donations
    module DonationsHelper
      def paypal_button
        render partial: "decidim/donations/donations/services/paypal"
      end
    end
  end
end
