module Spree
  module AbandondedOrders
    class Log < ActiveRecord::Base
      belongs_to :order, class_name: "Spree::Order",
                         inverse_of: :abandonded_orders_log,
                         touch: true
    end
  end
end