@javascript
Feature: browse cases

  Background:
    Given I have some cases, filters, and labels
    When I visit the home page

  Scenario: View the existing cases
    Then I should see all of my cases
    And the cases should have the correct labels

  Scenario: View the existing filters
    Then I should see all of my active filters
    And I should not see any inactive filters

  Scenario: Clicking on a filter
    When I click on a filter
    Then I should see all of the cases associated with that filter
    And I should not see any cases not associated with that filter