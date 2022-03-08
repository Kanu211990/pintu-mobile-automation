And(/^user tap back button on "(.*)" screen$/) do |screen|
  case screen
  when 'search result'
    BaseHelper.wait_for { $driver.find_element(:xpath, "//android.view.ViewGroup[@content-desc='bt_search']/preceding-sibling::*/android.widget.TextView").clickable? }
    $driver.find_element(:xpath, "//android.view.ViewGroup[@content-desc='bt_search']/preceding-sibling::*/android.widget.TextView").click
  when 'search'
    BaseHelper.wait_for { $driver.find_element(:xpath, "//android.widget.EditText[@content-desc='tf_search_key']/../preceding-sibling::*/android.widget.TextView").clickable? }
    $driver.find_element(:xpath, "//android.widget.EditText[@content-desc='tf_search_key']/../preceding-sibling::*/android.widget.TextView").click
  else
    BaseHelper.wait_for { $driver.find_element(:accessibility_id, 'bt_back_to').clickable? }
    $driver.find_element(:accessibility_id, 'bt_back_to').click
  end
end

And(/^user reset Tanihub app$/) do
  $driver.close_app
  $driver.launch_app
end

And(/^user tap back from user device$/) do
  $driver.back
end

And(/^user click "(.*)" on confirmation popup$/) do |button|
  sleep 2
  BaseHelper.wait_for { $driver.find_element(:id, 'android:id/buttonPanel').displayed? }
  $driver.find_element(:xpath, "//*[@resource-id='android:id/buttonPanel']/descendant::*[@text='#{button}']").click
end

And(/^user switch to Tanihub app "(.*)" env$/) do |app_env|
  if app_env.eql? 'staging'
    $driver.activate_app('com.tanihub.vaesdothrak.staging')
  else
    $driver.activate_app('com.tanihub.vaesdothrak.production')
  end
end

And(/^user pull to refresh "(.*)" screen$/) do |_screen|
  pull_to_refresh
  sleep 2
end
