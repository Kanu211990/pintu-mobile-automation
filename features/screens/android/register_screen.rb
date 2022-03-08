module Android
  class RegisterScreen < Appom::Page
    element :tf_name, :id, 'textInputEditTextName'
    element :tf_email, :id, 'textInputEditTextEmail'
    element :tf_password, :id, 'textInputEditTextPassword'
    element :tf_confirm_password, :id, 'textInputEditTextConfirmPassword'
    element :btn_register, :id, 'appCompatButtonRegister'
    element :message_snackbar, :id, 'snackbar_text'
    element :error_message_email, :xpath, "//android.widget.TextView[@text= 'Enter Valid Email']"
    element :error_message_name,  :xpath, "//android.widget.TextView[@text= 'Enter Full Name']"
    element :error_message_password, :xpath, "//android.widget.TextView[@text= 'Enter Password']"
    element :error_message_password_mismatch, :xpath, "//android.widget.TextView[@text= 'Password Does Not Matches']"
    element :link_login, :id, 'appCompatTextViewLoginLink'
  end
end
