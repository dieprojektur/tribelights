Feature: Private user profile management
  Scenario: Showing the private user profile
    Given I have one user with email "test@example.com" and password "testing123"
    And I am logged in with email "test@example.com" and password "testing123"
	And I go to the user profile page
	Then I should see "test@example.com's Profile"
