require 'rspec/expectations'
require 'appium_lib'
require 'pry'
require 'dotenv'
require 'data_magic'
require 'appom'
require 'rspec'
require 'selenium-cucumber'
require 'yaml'

require_relative '../lib/base_helper'

include RSpec::Matchers
include BaseHelper

Dotenv.load

DataMagic.yml_directory = './features/data/app_data'

caps_android = {
  deviceName: ENV['DEVICE_NAME_ANDROID_1'],
  automationName: 'UiAutomator2',
  platformName: 'Android',
  platformVersion: ENV['PLATFORM_VERSION_ANDROID_1'],
  app: ENV['APP_PATH_ANDROID'],
  noReset: false,
  fullReset: true,
  newCommandTimeout: '3600'
}

caps = caps_android
appium_lib_options = {
  server_url: 'http://0.0.0.0:4723/wd/hub'
}

Appom.register_driver do
  options = {
    appium_lib: appium_lib_options,
    caps: caps
  }
  $driver = Appium::Driver.new(options, false)
end

Appom.start_driver

Appom.configure do |config|
  config.max_wait_time = 30
end
