module Spree
  module AbandonedOrdersScopes
    extend ActiveSupport::Concern

    included do
      scope :abandoned, -> {
        where("state != ? AND (payment_state IS NULL OR payment_state != ?)
              AND email is NOT NULL",
              "complete",
              "paid")
      }
    end
  end
end
