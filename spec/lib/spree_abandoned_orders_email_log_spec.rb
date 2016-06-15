describe Spree::AbandonedOrders::EmailLog do
  describe '.notified?' do
    it 'includes logged orders' do
      order = create(:order_with_line_items)
      described_class.create(spree_order_id: order.id,
                             email_sent_at: Time.zone.now)
      notified = Spree::AbandonedOrders::EmailLog.notified?(order.id)
      expect(notified).to be_truthy
    end

    it 'does not include unlogged orders' do
      order = create(:order_with_line_items)
      notified = Spree::AbandonedOrders::EmailLog.notified?(order.id)
      expect(notified).to be_falsey
    end
  end
end


