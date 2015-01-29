Feature: Non-Admin Cannot Merge Articles
  As a non-admin user
  I cannot merge two articles

Background:
  Given the blog is set up
  And I am logged as a non-admin user
  And the following articles exist
  | id | title   | body         | author | allow_comments | published_at |
  | 1  | Title 1 | LoremIpsum   | First  | true           | '2015-01-29' |

Scenario: A non-admin cannot merge two articles
  Given I am on the article page for "Title 1"
  Then I should not see "Merge Articles"
  #And show me the page