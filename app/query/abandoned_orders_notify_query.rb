class AbandonedOrdersNotifyQuery
  def initialize(relation = Spree::Order.scoped)
    @relation = relation
  end

  def find_each(&block)
    @relation.find_each(&block)
  end
end