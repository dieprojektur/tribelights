Feature: Welcome Page
  Scenario: Anonymous visits homepage
    Given I am not authenticated
    Then I should not see "Welcome#index"
    And I should see "Sign In"
  
  Scenario: Registered User signs in and visits homepage
    Given I have one user with email "test@example.com" and password "testing123"
    And I am logged in with email "test@example.com" and password "testing123"
    And I go to the home page
    Then I should see "Sign Out"
    And I should see "Welcome, test@example.com"

