module Spree
  module AbandonedOrders
    class LookupQuery
      def initialize()
        @relation = Spree::Order.abandoned(begin_at, end_at)
      end

      def find_each(&block)
        @relation.find_each(&block)
      end

      private
      def begin_at
        (Time.zone.now - Spree::AbandonedOrdersConfig.ignore_after)
      end

      def end_at
        (Time.zone.now - Spree::AbandonedOrdersConfig.inactive_for)
      end

    end
  end
end
