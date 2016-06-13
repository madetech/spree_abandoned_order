module Spree
  class AbandonedOrdersConfiguration < Preferences::Configuration
    preference :send_email_after, :integer, default: 1.hours
    preference :dont_notify_after, :integer, default: 24.hours
  end
end