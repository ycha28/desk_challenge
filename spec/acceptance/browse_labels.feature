@javascript
Feature: browse labels

  Background:
    Given I have some cases, filters, and labels
    When I visit the labels page

  Scenario: View the existing labels
    Then I should see all of my labels