# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Donations
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Donations

      routes do
        root to: "donations#index"
        resources :donations do
          member do
            get "/thanks", action: "thanks", as: :thanks
          end
        end
      end

      initializer "decidim_donations.assets" do |app|
        app.config.assets.precompile += %w(decidim_donations_manifest.js decidim_donations_manifest.css)
      end
    end
  end
end
