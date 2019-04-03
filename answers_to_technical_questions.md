### 1a. How long did you spend on the code challenge?
Between 45-50 hours


### 1b. What would you add to your solution if you had more time? If you didn't spend much time on the code challenge then use this as an opportunity to explain what you would add.

I would:

  -Add Google Oauth or signup using email.

  -Include a link to reset password through email.

  -Add email address validation with the Kickbox API.

  -Set up Continuous Integration with Travis CI.

  -Remove instance variables from views.

  -Add mailers which users can opt into to receive emails when, for example, the team has a game coming up.

  -Improve the player_id generation algorithm to be more random.

  -Improve Player stats generation to be more random.

  -Add algorithm to ensure that no two player_id or stats_total are the same.

  -Consider refactoring some of the Team methods into the Player model.

  -Consider creating Pool and Roster Models with has_one relationships to Team and has_many to Player.

  -Investigate a bug in the TeamsController strong params which requires '/registration' rather than :team.

  -Investigate why the team edit page shows team id as :format. I'd like to ensure that this is information is hidden behind the edit/profile route.

  -Refactor the sessions for current_user so that it fails gracefully if cookies are deleted and user attempts to visit a page that requires a current_user.

  -Abstract .where clause methods on Team object into separate method to reduce duplication.

  -Abstract .order clause methods on Player object into separate method to reduce duplication.

  -Add breadcrumbs to Player Pool so the page doesn't reset to top when user selects a Player.

  -Use .persisted method instead of .save to ensure entry in database.

  -Refactor views with view helpers and make better use of partials.

  -Improve and refactor handling of changes/updates to Player status and on_team attributes in PlayersController.

  -Generally DRY out code in implementation and tests.

  -Use shoulda-matchers for sleeker tests.

  -Use factory_bot to generate factories to improve tests.

  -Reconsider how many times each line is hit in tests to improve test speed.

  -Refactor stats_total out of PlayerController into Player model.

  -Clear out fields on Login and Registration page when form fails to submit.

  -Investigate why fill_in...with... consistently fails on registration feature test.

  -Investigate redirect in TeamController edit method so it doesn't display Team id as :format when update fails.

  -Add option to permanently delete Team from database with dependent destroy on Players.

  -Refactor team selection to possibly use a 'cart' to store players in session, only to be saved when condition is met.

  -Add a footer with legal info (robot liability) and contact info.

### 2a. What was the most useful feature that was added to the latest version of the language you used (Ruby 2.4.3).
I haven't had much chance to explore the changes to Ruby 2.4.3. I think the compare_by_identity method could be useful for creating sets in which you need to compare integers and strings for equality. The hash.transform_values method is a nice addition too. I'm also curious to see if binding.irb is more useful that binding.pry.

### 2b. Please include a snippet of code that shows how you've used it.
I didn't use any of these new methods in my code. I'm sure I'll find uses for them in the future.

### 3a. How would you track down a performance issue in production?

I would use a benchmarking tool like Relic to check the performance of my queries, and try to minimize the number of trips to the database in each query. I'd try to use whatever logs are available from the production server to check how long each query took, and whether any of the logic in methods on Models could be pushed down the stack to the database. I would look into caching data if appropriate, and try to figure out how often I needed to invalidate that cache based on expected user behavior. I might also look into assigning some tasks to a background worker.

### 3b. Have you ever had to do this?

No, I haven't had to do any of it in a production environment.

### 4. Please describe yourself using JSON.

I've primarily used JSON to send and receive data from API's. I understand that Redis uses a JSON format for caching, but I've never had to use it before, as the data in my applications was usually changed too frequently for caching to make sense as a strategy.
