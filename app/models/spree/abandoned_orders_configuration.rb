module Spree
  class AbandonedOrdersConfiguration < Preferences::Configuration
    preference :inactivity_for, :integer, default: 4.hour
    preference :ignore_after, :integer, default: 5.days
  end
end
