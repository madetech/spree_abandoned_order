module Spree
  class AbandonedOrdersConfiguration < Preferences::Configuration
    preference :inactivity_for, :integer, default: 1.hour
    preference :ignore_after, :integer, default: 5.days
  end
end