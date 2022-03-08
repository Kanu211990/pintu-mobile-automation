module Android
  class LoginScreen < Appom::Page
    element :title_login, :xpath, "//android.widget.TextView[@text='VERSION - V4']"
    element :tf_email, :id, 'textInputEditTextEmail'
    element :tf_password, :id, 'textInputEditTextPassword'
    element :btn_login, :id, 'appCompatButtonLogin'
    #need to use absolute xpath because no avaliable locators
    element :error_message_password, :xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/TextInputLayout[2]/android.widget.LinearLayout/android.widget.TextView'
    element :error_message_email, :xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/TextInputLayout[1]/android.widget.LinearLayout/android.widget.TextView'
    element :error_message_wrong_email_or_password, :id, 'snackbar_text'
    element :link_register, :id, 'textViewLinkRegister'
  end
end
