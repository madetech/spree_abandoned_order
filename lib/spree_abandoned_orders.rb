require 'spree_core'
require 'spree_abandoned_orders/engine'
require 'spree_abandoned_orders/delivery_job'
require 'spree_abandoned_orders/filter_notified_query'
require 'spree_abandoned_orders/email_log'
require 'spree_abandoned_orders/lookup_query'
require 'spree_abandoned_orders/notifier'
require 'spree_abandoned_orders/scopes'

if defined?(Rails)
  require 'spree_abandoned_orders/railtie'
end
