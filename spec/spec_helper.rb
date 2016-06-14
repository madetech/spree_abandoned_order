Dir[File.join(File.dirname(__FILE__), "support/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.infer_spec_type_from_file_location!

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  config.include FactoryGirl::Syntax::Methods
  config.include Spree::TestingSupport::ControllerRequests
end
