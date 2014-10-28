$:.push File.expand_path("../lib", __FILE__)

require "shoppe/kiwipay/version"

Gem::Specification.new do |s|
  s.name        = "shoppe-kiwipay"
  s.version     = Shoppe::Kiwipay::VERSION
  s.authors     = ["Brendan Kilfoil"]
  s.email       = ["brendan@nakedapps.co.nz"]
  s.homepage    = "http://tryshoppe.com"
  s.summary     = "A Kiwipay module for Shoppe."
  s.description = "A Kiwipay module to assist with the integration of Stripe."

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "README.md"]

  s.add_dependency "shoppe", "~> 1.0.3"
end
