Feature: Some test
  In order to test a few basic things
  As a user
  I need to see a few basic things.

@api @1
  Scenario: Test If the site has a particular content type.
    Given I am logged in as an "administrator"
    When I visit "admin/structure/types"
    Then I see the "edit" in the "Testy" row

@javascript @2
Scenario: Test If a View has been changed.
    Given I am on "user/login"
    And I fill in "USERNAME" for "edit-name"
    And I fill in "PASSWORD" for "edit-pass"
    And I press the "edit-submit" button
    When I visit "admin/structure/views/view/test/edit"
    And I wait for AJAX to finish
    Then I should not see an "div#edit-locked" element
    And I should not see an "div#edit-changed" element

@javascript @3
Scenario: Test if JS n CSS aggregation is on
    Given I am on "user/login"
    And I fill in "USERNAME" for "edit-name"
    And I fill in "PASSWORD" for "edit-pass"
    And I press the "edit-submit" button
    When I visit "admin/config/development/performance"
    Then the "edit-preprocess-css" checkbox should be checked
    And the "edit-preprocess-js" checkbox should be checked

@javascript @4
Scenario: Test if a vocabulary is present.
    Given I am on "user/login"
    And I fill in "admin" for "edit-name"
    And I fill in "admin" for "edit-pass"
    And I press the "edit-submit" button
    And I visit "admin/structure/taxonomy"
    Then I see the "edit vocabulary" in the "VOCABULARY NAME" row