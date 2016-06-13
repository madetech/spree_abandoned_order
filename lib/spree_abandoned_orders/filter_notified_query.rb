module Spree
  module AbandonedOrders
    class FilterNotifiedQuery
      def initialize(relation = Spree::Order.abandoned)
        @relation = relation
      end

      def find_each(&block)
        @relation.find_each(&block)
      end
    end
  end
end