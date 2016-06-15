module Spree
  module AbandonedOrders
    class LookupQuery
      def initialize(relation = Spree::Order.abandoned)
        @relation = relation
      end

      def find_each(&block)
        @relation.where(updated_at: within_timeframe).find_each(&block)
      end

      private
      def within_timeframe
        begin_at = (Time.zone.now - Spree::AbandonedOrdersConfig.ignore_after)
        end_at = (Time.zone.now - Spree::AbandonedOrdersConfig.inactivity_for)
        (begin_at..end_at)
      end

    end
  end
end
