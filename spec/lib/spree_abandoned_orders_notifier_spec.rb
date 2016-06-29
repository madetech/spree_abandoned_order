describe Spree::AbandonedOrders::Notifier do
  let!(:order_a) { create(:order_with_line_items, email: 'test_a@test.com') }
  let!(:order_b) { create(:order_with_line_items, email: 'test_b@test.com') }

  context 'successful notification' do
    it 'should delivery email' do
      described_class.deliver(order_a)
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'persists log notification' do
      described_class.deliver(order_a)
      expect(Spree::AbandonedOrders::EmailLog.count).to eq(1)
    end
  end

  context 'failed notification' do
    it 'should rollback log' do
      expect {described_class.deliver(nil)}.to raise_error(Spree::AbandonedOrders::NotificationError)
      expect(Spree::AbandonedOrders::EmailLog.count).to eq(0)
    end

    it 'should not deliver an email' do
      expect {described_class.deliver(nil)}.to raise_error(Spree::AbandonedOrders::NotificationError)
      expect(ActionMailer::Base.deliveries.count).to eq(0)
    end
  end
end
