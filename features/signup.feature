Feature: As an User
  In order to user ProLit
  As an user
  I want signup and play with registration process

  Scenario: Able to Signup, able to resend instructions, and reset password
    Given an admin "Administrator"
    Given I am on signup page
    And I sign as "OxygenSmith"
    Then I should see "Signup Complete. Please Check Your Email"
    And I try to login as "OxygenSmith"
    Then I should see "You have to confirm your account before continuing."
    Then I confirm "OxygenSmith" via email
    And I try to login as "OxygenSmith"
    Then I should see "Your account has not been approved by admin yet."
    And Admin approves "OxygenSmith"
    And I login as "OxygenSmith"
    And I logout successfully
