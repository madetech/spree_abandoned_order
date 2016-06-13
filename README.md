# Abandoned Orders For Spree

An abandoned order extension for Spree, which looks for orders with line items that were created between X & Y days ago and sends an email notification to the customer to remind them to purchase.

##Installation

Add spree_abandoned_orders to your Gemfile:

```ruby
gem 'spree_abandoned_orders'
```

Bundle your dependencies and run the installation generator:

```shell
bundle install
bundle exec rails g spree_abandoned_orders:install

bundle exec rake db:migrate
```

Use the config values below to change settings:

```
Spree::AbandonedOrdersConfig.inactivity_for = 12.hours
Spree::AbandonedOrdersConfig.ignore_after = 5.days
```

Override the email view to customise:

```
app/views/spree/abandoned_order_mailer/abandoned_email.html.erb
```

Create a rake task to send the email:

```
desc "Abandoned order email"
task send_abandoned_order_emails: :environment do
    abandoned_orders = AbandonedOrdersQuery.new
    AbandonedOrdersNotNotifiedQuery.new(abandoned_orders).find_each do |order|
      AbandonedOrderNotifier.new(order)
    end
end
```


##Testing

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_abandoned_orders/factories'
```
