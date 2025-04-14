# frozen_string_literal: true

require 'selenium-webdriver'
require_relative './account_reader' # <1>

abort 'account file not specified.' unless ARGV.size == 1 # <2>
account = read_account(ARGV[0]) # <3>



# Initiate Webdriver
service = Selenium::WebDriver::Service.chrome(path:'./chromedriver.exe')
options =  Selenium::WebDriver::Chrome::Options.new
driver =  Selenium::WebDriver.for :chrome,options:options,service:service
wait =  Selenium::WebDriver::Wait.new(timeout:20)


driver.get 'https://www.amazon.co.jp/'
element = driver.find_element(:id, 'nav-link-accountList')
puts element.text
element.click
wait.until { driver.find_element(:id, 'ap_email').displayed? }
element = driver.find_element(:id, 'ap_email')
element.send_keys(account[:email])
element = driver.find_element(:id, 'continue')
element.click
wait.until { driver.find_element(:id, 'ap_password').displayed? }
element = driver.find_element(:id, 'ap_password')
element.send_keys(account[:password])
element = driver.find_element(:id, 'signInSubmit')
element.click
wait.until { driver.find_element(:id, 'nav-link-accountList').displayed? }
element = driver.find_element(:id, 'nav-orders')
element.click
wait.until { driver.find_element(:id, 'navFooter').displayed? }
puts driver.title
years = driver.find_element(:name, 'timeFilter') # <1>
select = Selenium::WebDriver::Support::Select.new(years) # <2>
select.select_by(:value, 'year-2021') # <3>
wait.until { driver.find_element(:id, 'navFooter').displayed? } # <4>

selector = 'div.your-orders-content-container__content li .a-fixed-left-grid-col.a-col-right > div:nth-child(1) > div > a'
titles = driver.find_elements(:css,selector)
puts titles.size
titles.map {|t| puts t.text}
sleep 3
driver.quit


