Feature: Create Category
  As an author
  In order to catrgories my thoughts to the world
  I want to create a category

  Scenario: Create new category
  Given I am on the categories page
  When I fill in "category_name" with "sun"
  And I fill in "category_keywords" with "sun"
  And I press "Save"
  Then I should see "sun"
