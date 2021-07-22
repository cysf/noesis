require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "https://www.unimed.coop.br"
  config.default_max_wait_time = 20
end

Capybara.page.driver.browser.manage.window.maximize
