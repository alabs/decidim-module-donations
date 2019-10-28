# frozen_string_literal: true

require_dependency "decidim/components/namer"

Decidim.register_component(:donations) do |component|
  component.admin_engine = Decidim::Donations::AdminEngine
  component.engine = Decidim::Donations::Engine
  component.icon = "decidim/donations/icon.svg"

  component.settings(:global) do |settings|
    settings.attribute :title, type: :string, translated: true, required: true
    settings.attribute :description, type: :text, translated: true, editor: true, required: true
    settings.attribute :excerpt, type: :string, translated: true, editor: true, required: true
    settings.attribute :paypal_enabled, type: :boolean, required: true, default: true
    settings.attribute :paypal_username, type: :string, required: true
    settings.attribute :paypal_password, type: :string, required: true
    settings.attribute :paypal_signature, type: :string, required: true
  end

  component.settings(:step) do |settings|
    settings.attribute :donations_enabled, type: :boolean, default: true
  end

  component.register_stat :donations_count, primary: true, priority: Decidim::StatsRegistry::MEDIUM_PRIORITY do |components, _start_at, _end_at|
    Decidim::Donations::Donation.where(component: components).count
  end

  component.register_stat :donations_amounts, primary: false, priority: Decidim::StatsRegistry::MEDIUM_PRIORITY do |components, _start_at, _end_at|
    Decidim::Donations::Donation.where(component: components).sum(:amount)
  end
end
