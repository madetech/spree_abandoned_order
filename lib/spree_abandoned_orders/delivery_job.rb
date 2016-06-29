module Spree
  module AbandonedOrders
    class DeliveryJob < Struct.new(:params)
      def perform
        abandoned_orders = Spree::AbandonedOrders::LookupQuery.new.find_each
        Spree::AbandonedOrders::FilterNotifiedQuery.new(abandoned_orders).find_each.each do |order|
          Spree::AbandonedOrders::Notifier.deliver(order)
        end
      end
    end
  end
end
