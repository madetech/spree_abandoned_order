module Spree
  class AbandondedOrder < Spree::Base
    belongs_to :order, class_name: "Spree::Order", inverse_of: :abandonded_orders, touch: true
  end
end