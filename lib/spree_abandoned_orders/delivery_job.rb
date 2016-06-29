module Spree
  module AbandonedOrders
    class DeliveryJob < Struct.new(:params)
      def perform
        abandoned_orders = Spree::AbandonedOrders::LookupQuery.new
        Spree::AbandonedOrders::FilterNotifiedQuery.new(abandoned_orders).find_each do |order|
          Spree::AbandonedOrders::Notifier.new(order)
        end
      end
    end
  end
end
