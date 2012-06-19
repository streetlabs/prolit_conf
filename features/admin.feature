Feature: As an Administrator
  In order to user ProLit Admin User Unterface
  As an Administrator
  I want signup to manage all Attendees/Users

  Scenario: Able to login to dashboard
    Given an admin "Administrator"
    When I login as "Administrator"
    Then I should see "Dashboard"
    And I logout successfully
