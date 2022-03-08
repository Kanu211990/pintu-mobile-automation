module Android
  class AccountDetailScreen < Appom::Page
    element :title_account, :xpath, "//android.widget.TextView[@text='All Accounts']"
    element :txt_email_value, :id, 'textViewEmail'
    element :txt_password_value, :id, 'textViewPassword'
    elements :txt_name_value, :xpath, "//android.widget.TextView[@resource-id='com.loginmodule.learning:id/textViewName']"
    element :title_android_learning, :xpath, "//android.widget.TextView[@text='Android NewLine Learning']"
    element :txt_hello, :xpath, "//android.widget.TextView[@text='Hello,']"
    element :txt_name, :xpath, "//android.widget.TextView[@text='Name']"
    element :txt_email, :xpath, "//android.widget.TextView[@text='Email']"
    element :txt_password, :xpath, "//android.widget.TextView[@text='Password']"
  end
end
