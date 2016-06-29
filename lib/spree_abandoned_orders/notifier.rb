module Spree
  module AbandonedOrders
    class NotificationError < StandardError; end

    class Notifier
      def self.deliver(order)
        new(order)
      end

      private
      def deliver_email
        Spree::AbandonedOrderMailer.notify(@order).deliver
      end

      def log_email
        Spree::AbandonedOrders::EmailLog.create!(spree_order_id: @order.id,
                                                 email_sent_at: Time.zone.now)
      end

      def initialize(order)
        @order = order
        save!
      end

      def save!
        begin
          ActiveRecord::Base.transaction do
            log_email && deliver_email
          end
        rescue
          raise NotificationError
        end
      end
    end
  end
end
