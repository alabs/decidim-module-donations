# frozen_string_literal: true

module Decidim
  module Donations
    module Admin
      class ApplicationController < Decidim::Admin::Components::BaseController
        helper_method :donations, :donation

        def donations
          @donations ||= Donation.where(component: current_component).page(params[:page]).per(15)
        end

        def donation
          @donation ||= Donation.find(params[:id])
        end
      end
    end
  end
end
