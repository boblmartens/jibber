Feature: Working with comments
  In order to post a comment to a post
  A user
  Should be able to post a comment
  
  Scenario: Posting new comment
    Given I am on a post page
    When I fill in "Body" with "My comment body"
    	And I press "Post Comment"
    Then I should see "My comment body"
    	And it should be on the post page

  Scenario: Editing a posted comment
    Given I am the original poster of the comment
			And I am on the post page
			And the comment is visible
			And I click the "Edit" link
    When I change the "Body" area with "My new comment body"
			And I press "Save Changes"
    Then there should see "My new comment body"
			And it should be on the post page
