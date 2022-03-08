@login_register
Feature: Register Feature

  #need register first in order create existing email data because after fresh install user no longer is existing user
  Scenario: new user register successfully and user cannot register using existing email
    Given user is on register screen
    When user enter "name" on register screen
    And user enter "email" on register screen
    And user enter "password" on register screen
    And user enter "confirm password" on register screen
    And user click register button on register screen
    Then user should be successfully register
    When user enter "name" on register screen
    And user enter "existing email" on register screen
    And user enter "password" on register screen
    And user enter "confirm password" on register screen
    And user click register button on register screen
    Then error message "email exist" should be displayed

  Scenario Outline: validation required field for register
    Given user is on register screen
    When user enter "<name_data>" on register screen
    And user enter "<email_data>" on register screen
    And user enter "<password_data>" on register screen
    And user enter "<confirm_password_data>" on register screen
    And user click register button on register screen
    Then error message "<error_details>" should be displayed
    Examples:
    |name_data|email_data|password_data|confirm_password_data|error_details|
    |blank name|existing email|password|confirm password|blank name|
    |name|invalid email|password|confirm password|invalid email|
    |name|blank email|password|confirm password|blank email|
    |name|existing email|blank password|confirm password|blank password|
    |name|existing email|password|confirm password1|password mismatch|

  


