module Spree
  module AbandonedOrders
    module Scopes
      extend ActiveSupport::Concern

      included do
        scope :abandoned, -> (begin_at, end_at) {
          where("state != ? AND (payment_state IS NULL OR payment_state != ?)
          AND (email is NOT NULL) AND (item_total > ?) AND (DATE(updated_at) BETWEEN ? AND ?)",
          "complete",
          "paid",
          "0.0",
          begin_at,
          end_at)
        }

      end
    end
  end
end
