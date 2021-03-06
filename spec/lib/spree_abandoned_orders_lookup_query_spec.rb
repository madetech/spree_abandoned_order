describe Spree::AbandonedOrders::LookupQuery do
  let!(:order1) { create(:order_with_line_items, updated_at: 2.day.ago) }
  let!(:order2) { create(:order_with_line_items, updated_at: 10.days.ago) }
  let!(:order3) { create(:shipped_order, updated_at: 10.seconds.ago) }
  let!(:order4) { create(:order, updated_at: 2.days.ago) }
  let!(:order5) { create(:order_with_line_items, updated_at: 3.day.ago) }

  subject { described_class.new.find_each }
  before(:all) {
    Spree::AbandonedOrdersConfig.inactive_for = 1.day
    Spree::AbandonedOrdersConfig.ignore_after = 5.days
  }

  it 'should include orders between 1 and 5 days old' do
    is_expected.to include(order1)
    is_expected.to include(order5)
  end

  it 'should exclude orders that are > 5 days old' do
    is_expected.to_not include(order2)
  end

  it 'should exclude orders than are < 1 day old' do
    is_expected.to_not include(order3)
  end

  it 'should exclude orders without line items' do
    is_expected.to_not include(order4)
  end
end
