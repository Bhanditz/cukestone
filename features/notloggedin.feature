Feature: Users Not Logged in

Scenario:  Does Homepage look reasonible?
   When I am on the homepage
   Then I should be on the homepage
   And I should see "Imagine an electronic page for each species of organism on Earth..."
   And I should see "Explore"
   And I should see "EOL Announcements"
   And I should see "Featured"

Scenario:  Login Requires username and password
   When I am on the homepage 
   Then I should be on the homepage
  