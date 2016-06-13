module Spree
  module AbandonedOrders
    class LookupQuery
      def initialize(relation = Spree::Order.abandoned)
        @relation = relation
      end

      def find_each(&block)
        begin_timeframe = (Time.zone.now - Spree::AbandonedOrdersConfig.inactivity_before_considered_abandoned)
        end_timeframe = (Time.zone.now - Spree::AbandonedOrdersConfig.ignore_after_timeframe)
        @relation.where(updated_at: (end_timeframe..begin_timeframe)).find_each(&block)
      end
    end
  end
end