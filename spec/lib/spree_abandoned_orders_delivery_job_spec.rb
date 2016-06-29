describe Spree::AbandonedOrders::DeliveryJob do
  let!(:order) { create(:order_with_line_items, updated_at: 2.day.ago) }
  subject { described_class.new }

  before(:all) {
    Spree::AbandonedOrdersConfig.inactive_for = 1.day
    Spree::AbandonedOrdersConfig.ignore_after = 10.days
  }

  describe '.perform' do
    it 'sends email to a customer' do
      subject.perform
      expect(ActionMailer::Base.deliveries.count).to be 1
    end
  end

end
