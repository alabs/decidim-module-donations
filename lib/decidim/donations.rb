# frozen_string_literal: true

require "decidim/donations/admin"
require "decidim/donations/admin_engine"
require "decidim/donations/engine"
require "decidim/donations/component"

module Decidim
  module Donations
    autoload :Providers, "decidim/donations/providers"
  end
end
