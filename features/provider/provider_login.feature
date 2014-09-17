Feature: provider login

  As a provider
  I want to login
  So I can access my account

  Background:
    Given an unlogged provider
    And I am on my provider login page

#Happy Path
  Scenario: login successful
    When I login with valid provider credentials
    Then I should be on the homepage

#Happy Path
  Scenario: login unsuccessful
    When I login with invalid provider credentials
    Then I should be redirected to the provider login page
    And I should see a please wrong password email combination
