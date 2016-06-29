require 'spree_abandoned_orders'
namespace :abandoned_orders do
  desc 'notify customers about abandoned orders'
  task :notify do
    abandoned_orders = Spree::AbandonedOrders::LookupQuery.new.find_each
    Spree::AbandonedOrders::FilterNotifiedQuery.new(abandoned_orders).find_each.each do |order|
      Spree::AbandonedOrders::Notifier.new(order).save
    end
  end
end
