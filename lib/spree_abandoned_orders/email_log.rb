module Spree
  module AbandondedOrders
    class EmailLog < ActiveRecord::Base
      belongs_to :order, class_name: "Spree::Order"

      self.table_name = :spree_abandoned_orders_email_logs

      def self.notified?(order_id)
        where(spree_order_id: order_id).count > 0
      end
    end
  end
end
