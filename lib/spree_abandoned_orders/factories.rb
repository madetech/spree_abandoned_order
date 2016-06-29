FactoryGirl.modify do
  [:order, :order_with_line_items, :shipped_order].each do |name|
    factory name do
      after(:create) do |order, evaluator|
        order.update_attribute(:updated_at, evaluator.updated_at)
      end
    end
  end
end
