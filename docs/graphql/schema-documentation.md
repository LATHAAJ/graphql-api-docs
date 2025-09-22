# GraphQL Schema Documentation

This document provides a comprehensive reference for the Cricket Players Management GraphQL API schema.

## Queries

### findAll
Retrieve all cricket players in the system.

**Type:** `[Player]`

### findPlayerById
Look up a specific player by their unique identifier.

**Arguments:**
- `id: ID!` - The player's unique identifier

**Type:** `Player`

### findPlayersByTeam
Find all players belonging to a specific team.

**Arguments:**
- `team: Team!` - The team to filter by

**Type:** `[Player]`

### findPlayersByRole
Find all players with a specific role.

**Arguments:**
- `role: PlayerRole!` - The role to filter by

**Type:** `[Player]`

### findAllMatches
Retrieve all cricket matches in the system.

**Type:** `[Match]`

### findMatchById
Look up a specific match by its unique identifier.

**Arguments:**
- `id: ID!` - The match's unique identifier

**Type:** `Match`

### findPlayerStats
Get detailed statistics for a specific player.

**Arguments:**
- `playerId: ID!` - The player's unique identifier

**Type:** `PlayerStats`

## Mutations

### createPlayer
Create a new cricket player in the system.

**Arguments:**
- `name: String!` - Player's name
- `team: Team!` - Player's team
- `role: PlayerRole!` - Player's role
- `age: Int` - Player's age (optional)
- `dateOfBirth: String` - Player's date of birth (optional)
- `country: String` - Player's country (optional)

**Type:** `Player`

### updatePlayer
Update an existing player's information.

**Arguments:**
- `id: ID!` - Player's unique identifier
- `name: String` - Player's name (optional)
- `team: Team` - Player's team (optional)
- `role: PlayerRole` - Player's role (optional)
- `age: Int` - Player's age (optional)
- `dateOfBirth: String` - Player's date of birth (optional)
- `country: String` - Player's country (optional)

**Type:** `Player`

### deletePlayer
Remove a player from the system.

**Arguments:**
- `id: ID!` - Player's unique identifier

**Type:** `Boolean`

### createMatch
Create a new cricket match record.

**Arguments:**
- `opponent: String!` - Opposing team name
- `matchDate: String!` - Date of the match
- `venue: String!` - Match venue
- `result: MatchResult!` - Match result

**Type:** `Match`

### updatePlayerStats
Update or create player statistics.

**Arguments:**
- `playerId: ID!` - Player's unique identifier
- `matchesPlayed: Int` - Number of matches played (optional)
- `runs: Int` - Total runs scored (optional)
- `wickets: Int` - Total wickets taken (optional)
- `average: Float` - Player's average (optional)

**Type:** `PlayerStats`

## Types

### Player
Represents a cricket player with their basic information, team affiliation, and role.

**Fields:**
- `id: ID!` - Unique identifier for the player
- `name: String!` - The name of the player
- `team: Team!` - The team the player belongs to
- `role: PlayerRole!` - The role/position of the player
- `age: Int` - The age of the player
- `dateOfBirth: String` - The player's date of birth
- `country: String` - The country the player represents
- `stats: PlayerStats` - Detailed statistics for the player

### Match
Represents a cricket match with opponent details, venue, and result.

**Fields:**
- `id: ID!` - Unique identifier for the match
- `opponent: String!` - The opposing team in the match
- `matchDate: String!` - The date when the match was played
- `venue: String!` - The location where the match was played
- `result: MatchResult!` - The result of the match

### PlayerStats
Contains detailed statistical information about a player's performance.

**Fields:**
- `playerId: ID!` - The unique identifier of the player
- `matchesPlayed: Int` - Number of matches the player has participated in
- `runs: Int` - Total runs scored by the player
- `wickets: Int` - Total wickets taken by the player
- `average: Float` - The player's batting or bowling average

## Enums

### PlayerRole
Different roles a cricket player can have.

**Values:**
- `BATSMAN` - Player who specializes in batting
- `BOWLER` - Player who specializes in bowling
- `ALL_ROUNDER` - Player who can both bat and bowl effectively
- `WICKET_KEEPER` - Player who keeps wickets

### Team
Available cricket teams in the system.

**Values:**
- `CSK` - Chennai Super Kings
- `MI` - Mumbai Indians
- `DC` - Delhi Capitals
- `RCB` - Royal Challengers Bangalore
- `GT` - Gujarat Titans

### MatchResult
Possible outcomes of a cricket match.

**Values:**
- `WON` - Team won the match
- `LOST` - Team lost the match
- `DRAW` - Match ended in a draw
- `NO_RESULT` - Match had no result (rain, etc.)

## Scalars

### Boolean
The `Boolean` scalar type represents `true` or `false`.

### Float
The `Float` scalar type represents signed double-precision fractional values as specified by IEEE 754.

### ID
The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache.

### Int
The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.

### String
The `String` scalar type represents textual data, represented as UTF-8 character sequences.