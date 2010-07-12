Feature: Welcome Page
  Scenario: Anonymous visits homepage
    Given I am not authenticated
    Then I should see "TribeLights"
    And I should see "Sign In"
  
  Scenario: Registered User signs in and visits homepage
    Given I have one user with email "test@example.com" and password "testing123"
    And I am logged in with email "test@example.com" and password "testing123"
    And I go to the home page
    Then I should see "Sign Out"
    And I should see "Welcome, test@example.com"

  Scenario: Sign on page has no sign up link
    Given I am not authenticated
    And I go to the new user session page
    Then I should not see /[Ss]ign [Uu]p/

