Feature: Working with comments
  In order to post a comment to a post
  A user
	So that a discussion can happen

  Scenario: Posting new comment
    Given I am on a post page
    When I fill in "Body" with "My comment body"
    	And I press "Post Comment"
    Then I should see "My comment body"

  Scenario: Editing a posted comment
    Given I am the original poster of the comment
			And I am on the post page
			And the comment is visible
			And I press "Edit Comment"
    When I fill in "Body" with "My new comment body"
			And I press "Save Changes"
    Then I should see "My new comment body"
