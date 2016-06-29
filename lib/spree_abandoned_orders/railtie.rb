module CreateSendRails
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'lib/tasks/abandoned_orders.rake'
    end
  end
end
