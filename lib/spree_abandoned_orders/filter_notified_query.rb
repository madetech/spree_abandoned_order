module Spree
  module AbandonedOrders
    class FilterNotifiedQuery
      def initialize(relation = Spree::Order.all)
        @relation = relation
      end

      def find_each(&block)
        @relation.reject {|order| EmailLog.notified?(order.id) }
      end
    end
  end
end
