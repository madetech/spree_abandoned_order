# encoding: UTF-8
$:.push File.expand_path('./lib', File.dirname(__FILE__))
require 'spree_abandoned_orders/version'

Gem::Specification.new do |s|
  s.name = 'spree_abandoned_orders'
  s.version = Spree::AbandonedOrders::VERSION
  s.summary = 'Abandoned cart email'
  s.description = 'Abandoned cart email'
  s.required_ruby_version = '>= 2.2.4'

  s.authors = ['Nick Wood', 'Rory MacDonald', 'Andrew Scott']
  s.email = %w{nick@madetech.co.uk rory@madetech.co.uk andrew@madtech.co.uk}

  s.extra_rdoc_files = %w{LICENSE README.md}
  s.rdoc_options = %w{--charset=UTF-8}

  s.files = Dir['{app,lib,spec}/**/*.rb'] + s.extra_rdoc_files
  s.test_files    = %w{spec}
  s.require_paths = %w{lib}

  s.add_dependency 'spree', '~> 2.4'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
