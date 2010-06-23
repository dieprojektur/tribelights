Feature: Welcome Page
  Scenario: Anonymous visits homepage
    Given I am not authenticated
    Then I should see "Welcome#index"

