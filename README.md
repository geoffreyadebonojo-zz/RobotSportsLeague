# README
RobotSportsLeague is an application that allows teams to build and manage a roster you choose from 100 players unique to your team. Each player has strength, speed, and agility, so no two bots will perform the same. Select your team of 10 starters and 5 alternates with care...or have one generated for you!

* This app is built with Ruby 2.4.3 and Rails 5.2.2

### CLONE REPOSITORY
First clone down this repository to your local machine.
```
  git clone https://github.com/geoffreyadebonojo/RobotSportsLeague.git
```

### INSTALL GEMS
Next, run the bundle command to install gems.
```
  bundle
```

### DATABASE CREATION
Finally, you'll need to initialize the database with a rake command.
```
  rake db:{create,migrate}
```

If for some reason you'd like to reset the database, run
```
  rake db:{drop,create,migrate}
```
**WARNING: This destroys any data stored in the database, so be careful.**

### RUN IN LOCALHOST
Finally, to run the application in your browser, run
```
  rails s
```
Then navigate to **localhost:3000/home** in your browser.

### TESTING
This application is tested using RSpec and Capybara. You can run this app's test suite using rspec.
```
  rspec
```
You can see the test coverage in more detail using Simplecov. This will open a tab in your browser showing test coverage of relevant files.
```
  rspec
  open coverage/index.html
```
### USER INTERFACE

#### New Teams
If you are a new team wanting to register with our app, find the navigation bar at the top of the page and click the __"Register""__ link.
On the Registration page, please enter the name and email address for your team.

**Note about registration:** No two teams can have the same name or email address. If you try to register a name or email address that is already taken, the page will alert you that you will have to choose another name. If the passwords don't match, you won't be able to register your team. Choose a password and enter it in the password and password confirmation fields, then click __"Submit"__.

If you are able to register your team, you will be directed to your team's roster page.

Congratulations, your team is now registered!

#### Existing Teams
If you have already registered your team with our app, and are not logged in, find the navigation bar at the top of the page and click the __"Log in"__ link to be directed to the log in page.

Enter your team's _email address_ (not name!) and password. If no team by that name exists you will be alerted. If the password is incorrect, you will not be able to log in.

#### Team Roster
Upon successful log in or registration, you will be directed to your team's Roster page, where you can view stats for your players and manage the players on your team. You can access this page at any time by using the link marked __"View Roster"__ in the navigation bar.

**New Users:** Your Roster should be empty, as you have not selected any bots yet. Use the __"View Available Players"__ link to navigate to the player pool page, where you can see a list of all available players, and select players for your team. **See below**

**Existing Users:** If you log in as an existing team, you will be directed to your team's Roster page, where you can view all the bots currently on your Roster.

Any players who have not been assigned as either **Starters** or **Alternates** will be marked **Unassigned**.

Click the button marked __"Switch to Starter"__ to assign a player as a Starter on your team. A team can only have 10 starters at once, so choose carefully.

To assign a player as an alternate, click the button marked __"Switch to Alternate"__. A team can only have 5 alternates.

If you want to return a player to unassigned status as neither a starter nor an alternate, click the button marked __"Unassign Player"__. This does not remove a player from the team.

If you want to delete your team's roster, click the link at the top of the page marked __"Clear Roster"__. This will permanently remove all players from your roster, so be careful!

If you want to delete your team's roster _and generate a new one automatically_, click the link marked __"Auto Select"__ at the top of the page. This will clear your current roster and randomly select a new roster of 15 bots you can assign as starters or alternates. This is permanent so only regenerate your team if you mean to!

You can sort the players on your roster according to their
- player id (alphanumerically)
- name (alphabetically, including titles suck as Mr. or Dr.)
- speed attribute
- strength attribute
- agility attribute
- or total value of combined attributes

By clicking the links at the top of the table. This is a useful way to check your roster's strengths and weaknesses.

#### Player Selection
In order to add or remove players from your roster, use the __"View Available Players"__ link in the navigation bar.

The Player Pool consists of 100 players _unique to your team_, but only 15 can be on your roster at a given time. No other team can access your players. You can view player attributes and see their current status. Players who are not currently on your roster are designated **Free**. Add or remove players from your roster by using the buttons on the right side of the page. To add a player to your roster, click the button marked  __"Select Player"__. This adds an unassigned player to your roster. If you want to remove a player from your roster, click the button marked __"Unselect Player"__. You can view if a player on your roster has been assigned a status as a **Starter** or an **Alternate**. If you decide to remove a player from your roster, that player's status is reset to **Free**, and if you decide to add them back to your team, they return as **Unassigned**.

#### Team Profile
You can view your team's profile information by clicking the __"Team Profile"__ link in the navigation bar. This directs you to the Team profile page where you can view your team's registered name and email address. If you wish to edit your team's information, click the link marked __"Edit"__ to navigate to the page where you can change your team's name. You won't be able to change your name if the name you've chosen is already taken by another team.

#### Log out
You can log out of the application at any time by clicking the link marked __"Log out"__ in the navigation bar. This will send you back to the home page.
