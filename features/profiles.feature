Feature: Private user profile management
  In order to manage my profile
  As a user
  I want to make sure that only I can access and edit my profile

  Scenario: Showing the private user profile
    Given I have one user with email "test@example.com" and password "testing123"
    And I am logged in with email "test@example.com" and password "testing123"
    And I go to the profile page
    Then I should see "test@example.com's Profile"

  Scenario: Denying access to the private user profile
    Given I am not logged in
    And I go to the profile page
    Then I should be on the new user session page
    And I should see "Sign in"

  Scenario: Changing the profile
    Given I have one user with email "test@example.com" and password "testing123"
    And I am logged in with email "test@example.com" and password "testing123"
    And I go to the edit profile page
    And I fill in "profile_name_attributes_first" with "MyFirstName"
    And I fill in "profile_name_attributes_last" with "MyLastName"
    And I press "profile_submit"
    Then I should see "successfully updated"
    And I should see "MyFirstName MyLastName"
    
