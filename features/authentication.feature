Feature: Manage authentications
  In order to keep track of authentications
  A authentication mechanic
  Should be able to manage several authentications

  Scenario: Log in user
    Given I am on the index page
    When I fill in "user[email]" with "testy"
    And I fill in "user[password]" with "test"
    And I follow "login"
    Then I should see "Welcome back testy"
