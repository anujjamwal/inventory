require 'uri'
require 'net/http'

#CAPYBARA
require 'capybara/cucumber'
require 'capybara/session'
Capybara.default_driver = :selenium
Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_wait_time = 20

#gizmo!!
require 'gizmo'
World(Gizmo::Helpers)

Gizmo.configure do |config|
  config.mixin_dir = File.dirname(__FILE__) + '/../pages'
end