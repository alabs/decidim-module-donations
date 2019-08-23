# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/donations/version"

Gem::Specification.new do |s|
  s.version = Decidim::Donations.version
  s.authors = ["Mijail Rondon"]
  s.email = ["mijail@riseup.net"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/alabs/decidim-module-donations"
  s.required_ruby_version = ">= 2.3.1"

  s.name = "decidim-donations"
  s.summary = "A decidim donations module"
  s.description = "A decidim participatory component to add the ability of manage donations."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-admin", Decidim::Donations.version
  s.add_dependency "decidim-core", Decidim::Donations.version
end
