# GraphQL API Documentation

A comprehensive GraphQL API for managing cricket players, teams, matches, and player statistics.

## In this article

* [About the API](#about-the-api)
* [Queries](#queries)
* [Mutations](#mutations)
* [Types](#types)
* [Enums](#enums)
* [Example Queries](#example-queries)

---

## About the API

This GraphQL API provides comprehensive functionality for managing cricket players and their associated data. The API follows GraphQL best practices and provides type-safe operations for all cricket-related entities.

**Base URL:** `http://localhost:8080/graphql`

**Interactive Playground:** `http://localhost:8080/graphiql`

## Queries

The query type defines GraphQL operations that retrieve data from the server.

### findAll

Retrieve all cricket players in the system.

**Type:** `[Player]`

### findPlayerById

Look up a specific player by their unique identifier.

**Type:** `Player`

#### Arguments for `findPlayerById`

| Name | Type | Description |
|------|------|-------------|
| id | `ID!` | The unique identifier of the object. |

### findPlayersByTeam

Find all players belonging to a specific team.

**Type:** `[Player]`

#### Arguments for `findPlayersByTeam`

| Name | Type | Description |
|------|------|-------------|
| team | `Team!` | The team the player belongs to. |

### findPlayersByRole

Find all players with a specific role (batsman, bowler, etc.).

**Type:** `[Player]`

#### Arguments for `findPlayersByRole`

| Name | Type | Description |
|------|------|-------------|
| role | `PlayerRole!` | The role/position of the player. |

### findAllMatches

Retrieve all cricket matches in the system.

**Type:** `[Match]`

### findMatchById

Look up a specific match by its unique identifier.

**Type:** `Match`

#### Arguments for `findMatchById`

| Name | Type | Description |
|------|------|-------------|
| id | `ID!` | The unique identifier of the object. |

### findPlayerStats

Get detailed statistics for a specific player.

**Type:** `PlayerStats`

#### Arguments for `findPlayerStats`

| Name | Type | Description |
|------|------|-------------|
| playerId | `ID!` | The unique identifier of the player. |

## Mutations

The mutation type defines GraphQL operations that modify data on the server.

### createPlayer

Create a new cricket player in the system.

**Type:** `Player`

#### Arguments for `createPlayer`

| Name | Type | Description |
|------|------|-------------|
| name | `String!` | The name of the player. |
| team | `Team!` | The team the player belongs to. |
| role | `PlayerRole!` | The role/position of the player. |
| age | `Int` | The age of the player. |
| dateOfBirth | `String` | The player's date of birth. |
| country | `String` | The country the player represents. |

### updatePlayer

Update an existing player's information.

**Type:** `Player`

#### Arguments for `updatePlayer`

| Name | Type | Description |
|------|------|-------------|
| id | `ID!` | The unique identifier of the object. |
| name | `String` | The name of the player. |
| team | `Team` | The team the player belongs to. |
| role | `PlayerRole` | The role/position of the player. |
| age | `Int` | The age of the player. |
| dateOfBirth | `String` | The player's date of birth. |
| country | `String` | The country the player represents. |

### deletePlayer

Remove a player from the system.

**Type:** `Boolean`

#### Arguments for `deletePlayer`

| Name | Type | Description |
|------|------|-------------|
| id | `ID!` | The unique identifier of the object. |

### createMatch

Create a new cricket match record.

**Type:** `Match`

#### Arguments for `createMatch`

| Name | Type | Description |
|------|------|-------------|
| opponent | `String!` | The opposing team in the match. |
| matchDate | `String!` | The date when the match was played. |
| venue | `String!` | The location where the match was played. |
| result | `MatchResult!` | The result of the match. |

### updatePlayerStats

Update or create player statistics.

**Type:** `PlayerStats`

#### Arguments for `updatePlayerStats`

| Name | Type | Description |
|------|------|-------------|
| playerId | `ID!` | The unique identifier of the player. |
| matchesPlayed | `Int` | Number of matches the player has participated in. |
| runs | `Int` | Total runs scored by the player. |
| wickets | `Int` | Total wickets taken by the player. |
| average | `Float` | The player's batting or bowling average. |

## Types

### Player

Represents a cricket player with their basic information, team affiliation, and role.

| Field | Type | Description |
|-------|------|-------------|
| id | `ID!` | Unique identifier for the player |
| name | `String!` | The name of the player |
| team | `Team!` | The team the player belongs to |
| role | `PlayerRole!` | The role/position of the player |
| age | `Int` | The age of the player |
| dateOfBirth | `String` | The player's date of birth |
| country | `String` | The country the player represents |
| stats | `PlayerStats` | Detailed statistics for the player |

### PlayerStats

Contains detailed statistical information about a player's performance.

| Field | Type | Description |
|-------|------|-------------|
| playerId | `ID!` | The unique identifier of the player |
| matchesPlayed | `Int` | Number of matches the player has participated in |
| runs | `Int` | Total runs scored by the player |
| wickets | `Int` | Total wickets taken by the player |
| average | `Float` | The player's batting or bowling average |

### Match

Represents a cricket match with opponent details, venue, and result.

| Field | Type | Description |
|-------|------|-------------|
| id | `ID!` | Unique identifier for the match |
| opponent | `String!` | The opposing team in the match |
| matchDate | `String!` | The date when the match was played |
| venue | `String!` | The location where the match was played |
| result | `MatchResult!` | The result of the match |

## Enums

### Team

Available cricket teams in the system.

**Values:**

- `CSk` - Chennai Super Kings
- `MI` - Mumbai Indians
- `DC` - Delhi Capitals
- `RCB` - Royal Challengers Bangalore
- `GT` - Gujarat Titans

### PlayerRole

Different roles a cricket player can have.

**Values:**

- `BATSMAN` - Player who specializes in batting
- `BOWLER` - Player who specializes in bowling
- `ALL_ROUNDER` - Player who can both bat and bowl effectively
- `WICKET_KEEPER` - Player who keeps wickets

### MatchResult

Possible outcomes of a cricket match.

**Values:**

- `WON` - Team won the match
- `LOST` - Team lost the match
- `DRAW` - Match ended in a draw
- `NO_RESULT` - Match had no result (rain, etc.)

## Example Queries

### Get All Players
```graphql
query GetAllPlayers {
  findAll {
    id
    name
    team
    role
    age
    country
  }
}
```

### Get Player by ID
```graphql
query GetPlayer($id: ID!) {
  findPlayerById(id: $id) {
    id
    name
    team
    role
    stats {
      matchesPlayed
      runs
      wickets
      average
    }
  }
}
```

### Create New Player
```graphql
mutation CreatePlayer($name: String!, $team: Team!, $role: PlayerRole!) {
  createPlayer(name: $name, team: $team, role: $role) {
    id
    name
    team
    role
  }
}
```

