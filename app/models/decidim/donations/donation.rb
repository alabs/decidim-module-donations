# frozen_string_literal: true

module Decidim
  module Donations
    class Donation < ApplicationRecord
      include Decidim::HasComponent

      component_manifest_name "donations"
      
    end
  end
end
