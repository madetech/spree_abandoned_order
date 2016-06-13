FROM madetech/rails-deps

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile ./
COPY Gemfile.lock ./
COPY lib/spree_abandoned_orders/version.rb ./lib/spree_abandoned_orders/version.rb
COPY spree_abandoned_orders.gemspec ./
RUN bundle install --jobs 20 --retry 5
CMD ["bundle", "exec", "rake", "-T"]