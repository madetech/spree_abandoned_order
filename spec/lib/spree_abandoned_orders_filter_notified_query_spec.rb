describe Spree::AbandonedOrders::FilterNotifiedQuery do
  let!(:order1) { create(:order_with_line_items, updated_at: 2.day.ago) }
  let!(:order2) { create(:order_with_line_items, updated_at: 3.days.ago) }
  let!(:order3) { create(:order_with_line_items, updated_at: 4.days.ago) }
  let!(:order4) { create(:order_with_line_items, updated_at: 5.day.ago) }
  let!(:abandonded) { Spree::AbandonedOrders::LookupQuery.new.find_each }

  before(:all) {
    Spree::AbandonedOrdersConfig.inactive_for = 1.day
    Spree::AbandonedOrdersConfig.ignore_after = 10.days
  }

  context 'should include all orders' do
    subject { described_class.new(abandonded).find_each }

    it 'should include all orders' do
      is_expected.to include(order1)
      is_expected.to include(order2)
      is_expected.to include(order3)
      is_expected.to include(order4)
    end
  end

  context 'notification emails dispatched' do
    subject { described_class.new(abandonded).find_each }

    it 'should exclude orders which have been notified' do
      Spree::AbandonedOrders::Notifier.deliver(order1)
      Spree::AbandonedOrders::Notifier.deliver(order3)

      is_expected.to_not include(order1)
      is_expected.to_not include(order3)
      is_expected.to include(order2)
      is_expected.to include(order4)
    end
  end
end
