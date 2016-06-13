class AbandonedOrdersQuery
  def initialize(relation = Spree::Order.abandoned)
    @relation = relation
  end

  def find_each(&block)
    begin_timestamp = (Time.zone.now - Spree::AbandonedOrdersConfig.send_email_after)
    end_timestamp = (Time.zone.now - Spree::AbandonedOrdersConfig.dont_notify_after)
    @relation.where(updated_at: (end_timestamp..begin_timestamp)).find_each(&block)
  end
end