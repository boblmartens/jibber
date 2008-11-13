Feature: Posting an article
  In order to speak to the world
  A user
  Should be able to publish posts
  
  Scenario: Publish a new post without logging in
    Given I am on the index page
    When I follow "create a new post"
    And I fill in "post[body]" with "new post"
    And I fill in "post[title]" with "new title"
    And I press "publish post"
    Then I should see "new post"
