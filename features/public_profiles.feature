@selenium
Feature: Public Profiles
  In order to connect to other users
  As a user
  I want to be able to browse and search the public profiles

  Scenario: listing all users
    Given I have the following users:
      |email|password|firstname|lastname|birthday|
      |test1@test.com|testing123|Test1|Last1|2010-01-01|
      |test2@test.com|testing123|Test2|Last2|2010-02-01|
    And I go to the home page
    And I am logged in with email "test1@test.com" and password "testing123"
    And I go to the public profiles page
    Then I should see "Test1 Last1"
    And I should see "Test2 Last2"

  Scenario: listing all users when not logged in
    Given I am not logged in
    And I go to the public profiles page
    Then I should be on the new user session page

  Scenario: limiting the profile list
    Given I have the following users:
      |email|password|firstname|lastname|birthday|
      |test1@test.com|testing123|Test1|Last1|2010-01-01|
      |test2@test.com|testing123|Test2|Last2|2010-02-01|
      |test3@test.com|testing123|Test3|Last3|2005-02-01|
    And I go to the home page
    And I am logged in with email "test1@test.com" and password "testing123"
    And I go to the public profiles page
    And I fill in "search" with "Test1"
    And I press "go"
    Then I should see "Test1 Last1"
    And I should not see "Test2 Last2"
    And I should not see "Test3 Last3"
  
