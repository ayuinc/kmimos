Feature: provider authorizations

  Background:
    Given a logged in provider

  Scenario: provider can go to edit page
    When I am on my provider edit page
    Then I should be on my provider edit page

  Scenario: provider cannot go to another's edit page
    When I visit another provider's edit page
    Then I should be on the homepage

  Scenario: provider can't go to the sign up page
    When I go to the provider sign up page
    Then I should be redirected to the homepage

  # Scenario: provider can go to his 'fotos' page
  #   When I am on my provider fotos page
  #   Then I should be on my provider fotos page

  # Scenario: provider cannot go to another's 'fotos' page
  #   When I visit another provider's fotos page
  #   Then I should be on the homepage

