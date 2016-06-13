module Spree
  class AbandonedOrdersConfiguration < Preferences::Configuration
    preference :inactivity_before_considered_abandoned, :integer, default: 1.hour
    preference :ignore_after_timeframe, :integer, default: 5.days
  end
end