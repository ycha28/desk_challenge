@javascript
Feature: browse labels

  Background:
    Given I have some cases, filters, and labels
    Given I am on the home page
    When I visit the labels page

  Scenario: View the existing labels
    Then I should see all of my labels

  Scenario: Create a new label
    When I fill in a label name
    And I press "Create"
    And I visit the labels page
    Then I should see my new label