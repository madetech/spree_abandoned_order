describe Spree::AbandonedOrders::Notifier do
  let!(:order) { create(:order_with_line_items, updated_at: 2.day.ago) }
  subject { described_class.new(order).save }

  context 'successful notification' do
    it 'should delivery email' do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'persists log notification' do
      is_expected.to_not include(order2)
    end
  end

  context 'failed notification' do
    it 'should rollback log' do
      is_expected.to be_falsey
    end

    it 'should not deliver an email' do
      expect(ActionMailer::Base.deliveries.count).to eq(0)
    end
  end
end
