# frozen_string_literal: true

require_dependency "decidim/components/namer"

Decidim.register_component(:donations) do |component|
  component.admin_engine = Decidim::Donations::AdminEngine
  component.engine = Decidim::Donations::Engine
  component.icon = "decidim/donations/icon.svg"
end
