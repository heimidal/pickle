# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '../../../../../../config/environment')
require 'cucumber/rails/world'
Cucumber::Rails.use_transactional_fixtures

# Comment out the next line if you're not using RSpec's matchers (should / should_not) in your steps.
require 'cucumber/rails/rspec'

# Pickle
require 'pickle/world'
require 'pickle/page/world'
require 'pickle/email/world'

Pickle.configure do |c|
  c.map 'I', :to => 'user: "me"'
  c.map 'killah fork', :to => 'fancy fork: "of cornwood"'
end

# test app setup
__APP__ = File.expand_path(File.join(File.dirname(__FILE__), '../app'))
require "#{__APP__}/app"
require "#{__APP__}/factories"
require "#{__APP__}/blueprints"
require "#{__APP__}/faux_webrat"

# reset shams between scenarios
Before { Sham.reset }