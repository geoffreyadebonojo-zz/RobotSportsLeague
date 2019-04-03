# README

RobotSportsLeague is an application that allows teams to build and manage a roster of unique players. Each player has strength, speed, and agility, so no two bots will perform the same. Select your team of 10 starters and 5 alternates with care...or have one generated for you! Pit bots against one another in a fight to the finish, where only one bot comes out on top!

* This app is built with Ruby 2.4.3 and Rails 5.2.2

### CLONE REPOSITORY
First clone down this repository to your local machine.
```
  git clone https://github.com/geoffreyadebonojo/RobotSportsLeague.git
```

### INSTALL GEMS
2: Next, run the bundle command to install gems.
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
