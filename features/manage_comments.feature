Feature: Manage comments
  In order to keep track of comments
  A comments mechanic
  Should be able to manage several comments
  
  Scenario: Register new comments
    Given I am on the new comments page
    And I press "Create"

  Scenario: Delete comments
    Given there are 4 comments
    When I delete the first comments
    Then there should be 3 comments left
    
  More Examples:
    | initial | after |
    | 100     | 99    |
    | 1       | 0     |