@javascript
Feature: update case

  Background:
    Given I have some cases, filters, and labels
    When I visit the home page
    And I open a case

  Scenario: View the existing case
    Then I should see all of the details of the case

  Scenario: Update the case
    When I change the details of the case
    And I press "Update"
    Then I should see all of the changes made to my case
