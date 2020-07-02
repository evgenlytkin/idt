# frozen_string_literal: true

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome

  browser_options = Selenium::WebDriver::Chrome::Options.new
  browser_options.add_argument("headless")
  browser_options.add_argument("window-size=1920,1080")
  browser_options.add_argument("disable-gpu")
  browser_options.add_argument("disable-dev-shm-usage")

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 options: browser_options,
                                 desired_capabilities: capabilities,
                                 http_client: Selenium::WebDriver::Remote::Http::Default.new
end
