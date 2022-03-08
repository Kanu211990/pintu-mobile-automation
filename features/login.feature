@login_register
Feature: Login Feature

#need register first and then login because after fresh install user no longer is existing user
  Scenario: existing user login successfully
    Given user is on register screen
    When user enter "name" on register screen
    And user enter "email" on register screen
    And user enter "password" on register screen
    And user enter "confirm password" on register screen
    And user click register button on register screen
    Then user should be successfully register
    When user navigate to login screen from register screen
    And user on Login screen
    When user enter "existing email" on login screen
    And user enter "existing password" on login screen
    And user click button login on login screen
    Then user account details should be displayed

  Scenario Outline: validation required field for login
    Given user on Login screen
    When user enter "<email_type>" on login screen
    And user enter "<password_type>" on login screen
    And user click button login on login screen
    Then error message for "<error_message_details>" should be displayed
    Examples:
    |email_type|password_type|error_message_details|
    |invalid email|existing password|invalid email|
    |existing email|blank password|blank password|
    |blank email|existing password|blank email|
    |wrong email|existing password|wrong email|
    |existing email|wrong password|wrong password|
    |blank email|blank password|blank email or password|
    |wrong email|wrong password|wrong email or password|


