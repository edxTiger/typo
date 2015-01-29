Feature: Merge Articles
  As a blog administrator
  In order to get rid of similar articles
  I want to merge two articles

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And the following articles exist
  | id | title   | body         | author | allow_comments | published_at |
  | 1  | Title 1 | LoremIpsum   | First  | true           | '2015-01-29' |
  | 2  | Title 2 | LoremIpsum 2 | Second | true           | '2015-01-29' |
  | 3  | Title 3 | LoremIpsum 3 | Third  | true           | '2015-01-29' |
  | 4  | Title 4 | LoremIpsum 4 | Fourth | true           | '2015-01-29' |
  And the following comments exist
  | id | title   | body                 | author |
  | 10 | Title 2 | LoremIpsum Comment   | Second |
  | 11 | Title 3 | LoremIpsum Comment 2 | Third  |


Scenario: Successfully merge articles by title
  Given I am on the article page for "Title 1"
  #And show me the page
  And I fill in "merge_with" with "4"
  And I press "Merge"
  Then I should see "Title 1 Title 4"
  #And show me the page

Scenario: Successfully merge articles by body
  Given I am on the article page for "Title 2"
  And I fill in "merge_with" with "3"
  #And show me the page
  And I press "Merge"
  Then the article "Title 2 Title 3" should have body "LoremIpsum 2 LoremIpsum 3"


Scenario: Successfully merge articles by author
  Given I am on the article page for "Title 3"
  #And show me the page
  And I fill in "merge_with" with "4"
  And I press "Merge"
  Then the article "Title 3 Title 4" should have author "Third"
  #And show me the page

Scenario: Successfully merge articles by comment when article with comment merging with article with comment
  Given I am on the article page for "Title 2"
  #And show me the page
  And I fill in "merge_with" with "3"
  And I press "Merge"
  Then I follow "Comments"
  And I follow "Title 2 Title 3"
  And I should see "LoremIpsum Comment"
  And I should see "LoremIpsum Comment 2"
  #And show me the page

Scenario: Successfully merge articles by comment when article with comment merging with article without comment
  Given I am on the article page for "Title 2"
  #And show me the page
  And I fill in "merge_with" with "1"
  And I press "Merge"
  Then I follow "Comments"
  And I follow "Title 2 Title 1"
  And I should see "LoremIpsum Comment"
  #And show me the page
  #And I should not see "LoremIpsum Comment 2"
  #And show me the page  

Scenario: Successfully merge articles by comment when article without comment merging with article with comment
  Given I am on the article page for "Title 1"
  #And show me the page
  And I fill in "merge_with" with "3"
  And I press "Merge"
  Then I follow "Comments"
  And I follow "Title 1 Title 3"
  And I should see "LoremIpsum Comment 2"
  #And show me the page
  #And I should not see "LoremIpsum Comment"
  #And show me the page    

Scenario: Successfully merge articles by comment when article without comment merging with article without comment
  Given I am on the article page for "Title 1"
  #And show me the page
  And I fill in "merge_with" with "4"
  And I press "Merge"
  Then I follow "Comments"
  And I should not see "Title 1 Title 4"
  #And show me the page
