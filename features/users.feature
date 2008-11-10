Feature: Simple user control
  In order to encourage discussion
  A guest
  Should be able to register as a user

	Scenario: Register new user
    Given I am on the registration page
    When I fill in "email" with "test@test.org"
		And I fill in "password" with "testing"
		And I fill in "name" with "testy"
		And I press "register me"
		Then I should see "test@test.org"

	Scenario: Update user information
		Given a user "testy"
		And I am on the members page
		When I follow "Edit"
		And I fill in "email" with "new@new.com"
		And I press "update"
		Then I should see "new@new.com"
