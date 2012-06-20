Feature: As an Administrator
  In order to user ProLit Admin User Unterface
  As an Administrator
  I want signup to manage all Attendees/Users

  Scenario: Able to login to dashboard
    Given an admin "Administrator"
    When I login as "Administrator"
    Then I should see "Dashboard"
    And I logout successfully

  Scenario: Able to Activate and Deactivate accounts and modify roles
    Given an admin "Administrator"
    Given a confirmed attendee "OxygenSmith"
    When I login as "Administrator" to access "Attendees"
    Then I should see "OxygenSmith" account status as "deactivated"
    And I activate "OxygenSmith" account
    Then I should see "OxygenSmith" account status as "activated"
    And I update "OxygenSmith" role to "presenter"
    Then I should see "OxygenSmith" roles set to "Presenter"
