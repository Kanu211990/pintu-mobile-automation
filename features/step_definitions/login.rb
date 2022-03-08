Given(/^user on Login screen$/) do
  BaseHelper.wait_for { @app.login_screen.title_login.displayed? }
  expect(@app.login_screen.title_login.displayed?).to be true
end

When(/^user navigate to login screen from register screen$/) do
  BaseHelper.swipe_direction('up')
  BaseHelper.wait_for { @app.register_screen.link_login.displayed? }
  sleep 1
  @app.register_screen.link_login.click
end

When(/^user enter "(.*)" on login screen$/) do |field_name|
  @login_data = LoginRequirement.new.load_data('existing_customer')
  if field_name.include? 'email'
    BaseHelper.wait_for { @app.login_screen.tf_email.displayed? }
    case field_name
    when 'existing email'
      @app.login_screen.tf_email.send_keys @login_data['email']
    when 'invalid email'
      @app.login_screen.tf_email.send_keys @login_data['invalid_email']
    when 'blank email'
      @app.login_screen.tf_email.send_keys ''
    when 'wrong email'
      @app.login_screen.tf_email.send_keys @login_data['wrong_email']
    end
  else
    BaseHelper.wait_for { @app.login_screen.tf_password.displayed? }
    case field_name
    when 'existing password'
      @app.login_screen.tf_password.send_keys @login_data['password']
    when 'blank password'
      @app.login_screen.tf_password.send_keys ''
    when 'wrong password'
      @app.login_screen.tf_password.send_keys @login_data['wrong_password']
    end
  end
end

When(/^user click button login on login screen$/) do
  BaseHelper.wait_for { @app.login_screen.btn_login.clickable? }
  @app.login_screen.btn_login.click
end

Then(/^user account details should be displayed$/) do
  BaseHelper.wait_for { @app.account_detail_screen.title_android_learning.displayed? }
  expect(@app.account_detail_screen.title_android_learning.displayed?).to be true
  BaseHelper.wait_for { @app.account_detail_screen.txt_hello.displayed? }
  expect(@app.account_detail_screen.txt_hello.displayed?).to be true
  BaseHelper.wait_for { @app.account_detail_screen.txt_name_value.empty? == false }
  expect(@app.account_detail_screen.txt_name_value[0].text).to eq @login_data['email']
  BaseHelper.wait_for { @app.account_detail_screen.title_account.displayed? }
  expect(@app.account_detail_screen.title_account.displayed?).to be true
  BaseHelper.wait_for { @app.account_detail_screen.txt_name.displayed? }
  expect(@app.account_detail_screen.txt_name.displayed?).to be true
  BaseHelper.wait_for { @app.account_detail_screen.txt_name_value.empty? == false }
  expect(@app.account_detail_screen.txt_name_value[1].text).to eq @login_data['name']
  BaseHelper.wait_for { @app.account_detail_screen.txt_email.displayed? }
  expect(@app.account_detail_screen.txt_email.displayed?).to be true
  BaseHelper.wait_for { @app.account_detail_screen.txt_email_value.displayed? }
  expect(@app.account_detail_screen.txt_email_value.text).to eq @login_data['email']
  BaseHelper.wait_for { @app.account_detail_screen.txt_password.displayed? }
  expect(@app.account_detail_screen.txt_password.displayed?).to be true
  BaseHelper.wait_for { @app.account_detail_screen.txt_password_value.displayed? }
  expect(@app.account_detail_screen.txt_password_value.text).to eq @login_data['password']
end

Then(/^error message for "(.*)" should be displayed$/) do |error_message|
  case error_message
  when 'invalid email', 'blank email', 'blank email or password'
    BaseHelper.wait_for { @app.login_screen.error_message_email.displayed? }
    expect(@app.login_screen.error_message_email.text).to eq @login_data['error_message_invalid_email_or_password']
  when 'blank password'
    BaseHelper.wait_for { @app.login_screen.error_message_password.displayed? }
    expect(@app.login_screen.error_message_password.text).to eq @login_data['error_message_invalid_email_or_password']
  when 'wrong email', 'wrong password', 'wrong email or password'
    BaseHelper.wait_for { @app.login_screen.error_message_wrong_email_or_password.displayed? }
    expect(@app.login_screen.error_message_wrong_email_or_password.text).to eq @login_data['error_message_wrong_email_or_password']
  end
end
