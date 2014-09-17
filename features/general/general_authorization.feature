Feature: general authorizations

  Background:
    Given an unlogged provider

  Scenario: visitor cannot go to another's edit page
    When I visit another provider's edit page
    Then I should be on the provider login page