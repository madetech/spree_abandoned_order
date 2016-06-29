module Spree
  module AbandonedOrders
    class DeliveryJob < Struct.new(:params)
      def perform
        abandoned_orders = LookupQuery.new.find_each
        FilterNotifiedQuery.new(abandoned_orders).find_each.each do |order|
          Notifier.deliver(order)
        end
      end
    end
  end
end
