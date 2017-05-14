### Project: Tournament Database

Build a database backed application that determines the winner of a swiss-style game tournament.

---

Install PostgreSQL : [PostgreSQL Download Page](https://www.postgresql.org/download/)

 1. Launch the psql console from the command line by typing: psql
 2. Create database by typing: CREATE DATABASE tournament;
 2. Connect to the tournament database by typing: \c tournament 
 3. Import the schema for the tournament database by typing: \i tournament.sql

To run the tests:

    python tournament_test.py

You should see:

1. countPlayers() returns 0 after initial deletePlayers() execution.
2. countPlayers() returns 1 after one player is registered.
3. countPlayers() returns 2 after two players are registered.
4. countPlayers() returns zero after registered players are deleted.
5. Player records successfully deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After match deletion, player standings are properly reset.
9. Matches are properly deleted.
10. After one match, players with one win are properly paired.
***Success!  All tests pass!***
