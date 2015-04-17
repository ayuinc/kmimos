Feature: provider update account

  As a provider
  I want to update my account
  So that my information is up to date

  Background:
    Given a logged in provider
    And I am on my provider edit page

  Scenario: successfully updated category
#  When I update my provider category
#  Then I should have successfully updated my provider category


  Scenario: successfully updated DNI
    When I update my provider dni
    Then I should have successfully updated my provider dni
