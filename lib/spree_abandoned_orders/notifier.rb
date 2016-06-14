module Spree
  module AbandonedOrders
    class Notifier
      def initialize(order)
        @order = order
      end

      def save
        ActiveRecord::Base.transaction do
          deliver_email && log_email
        end
      end

      private

      def deliver_email
        Spree::AbandonedOrderMailer.notify(@order).deliver
      end

      def log_email
        Spree::AbandonedOrders::EmailLog.create(spree_order_id: @order.id,
                                                email_sent_at: Time.zone.now)
      end
    end
  end
end
