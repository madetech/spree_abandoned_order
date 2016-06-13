module Spree
  module AbandonedOrders
    class Engine < Rails::Engine
      require 'spree/core'
      isolate_namespace Spree
      engine_name 'spree_abandoned_orders'

      config.generators do |g|
        g.test_framework :rspec
      end

      initializer 'spree_abandoned_orders.environment', before: 'spree.environment' do
        Spree::AbandonedOrdersConfig = Spree::AbandonedOrdersConfiguration.new
      end

      def self.activate
        Spree::Order.include(Spree::AbandonedOrders::Scopes)
      end

      config.to_prepare(&method(:activate).to_proc)
    end
  end
end
