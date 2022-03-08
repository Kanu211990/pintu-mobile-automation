Given(/^user is on register screen$/) do
  BaseHelper.wait_for { @app.login_screen.link_register.displayed? }
  @app.login_screen.link_register.click
  BaseHelper.wait_for { @app.register_screen.tf_name.displayed? }
  expect(@app.register_screen.tf_name.displayed?).to be true
end

When(/^user enter "(.*)" on register screen$/) do |field_name|
  @register_details = RegisterRequirement.new.load_data('register_details')
  p @register_detail
  case field_name
  when 'name'
    BaseHelper.wait_for { @app.register_screen.tf_name.displayed? }
    @app.register_screen.tf_name.send_keys @register_details['name']
  when 'blank name'
    BaseHelper.wait_for { @app.register_screen.tf_name.displayed? }
    @app.register_screen.tf_name.send_keys ''
  when 'email', 'existing email'
    BaseHelper.wait_for { @app.register_screen.tf_email.displayed? }
    @app.register_screen.tf_email.send_keys @register_details['email']
  when 'invalid email'
    BaseHelper.wait_for { @app.register_screen.tf_email.displayed? }
    @app.register_screen.tf_email.send_keys @register_details['invalid_email']
  when 'blank email'
    BaseHelper.wait_for { @app.register_screen.tf_email.displayed? }
    @app.register_screen.tf_email.send_keys ''
  when 'password'
    BaseHelper.wait_for { @app.register_screen.tf_password.displayed? }
    @app.register_screen.tf_password.send_keys @register_details['password']
  when 'blank password'
    BaseHelper.wait_for { @app.register_screen.tf_password.displayed? }
    @app.register_screen.tf_password.send_keys ''
  when 'confirm password'
    BaseHelper.wait_for { @app.register_screen.tf_confirm_password.displayed? }
    @app.register_screen.tf_confirm_password.send_keys @register_details['confirm_password']
  when 'confirm password1'
    BaseHelper.wait_for { @app.register_screen.tf_confirm_password.displayed? }
    @app.register_screen.tf_confirm_password.send_keys @register_details['confirm_password1']
  end
end

When(/^user click register button on register screen$/) do
  BaseHelper.wait_for { @app.register_screen.btn_register.displayed? }
  @app.register_screen.btn_register.click
end

Then(/^user should be successfully register$/) do
  BaseHelper.wait_for { @app.register_screen.message_snackbar.displayed? }
  expect(@app.register_screen.message_snackbar.text).to eq @register_details['message_success']
end

Then(/^error message "(.*)" should be displayed$/) do |error_details|
  case error_details
  when 'email exist'
    BaseHelper.wait_for { @app.register_screen.message_snackbar.displayed? }
    expect(@app.register_screen.message_snackbar.text).to eql @register_details['error_message_email_exist']
  when 'blank email', 'invalid email'
    BaseHelper.wait_for { @app.register_screen.error_message_email.displayed? }
    expect(@app.register_screen.error_message_email.displayed?).to be true
  when 'blank password'
    BaseHelper.wait_for { @app.register_screen.error_message_password.displayed? }
    expect(@app.register_screen.error_message_password.displayed?).to be true
  when 'password mismatch'
    BaseHelper.wait_for { @app.register_screen.error_message_password_mismatch.displayed? }
    expect(@app.register_screen.error_message_password_mismatch.displayed?).to be true
  end
end
