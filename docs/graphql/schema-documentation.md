# GraphQL API Documentation

<details>
  <summary><strong>Table of Contents</strong></summary>

  * [Query](#query)
  * [Mutation](#mutation)
  * [Objects](#objects)
    * [Match](#match)
    * [Player](#player)
    * [PlayerStats](#playerstats)
  * [Enums](#enums)
    * [MatchResult](#matchresult)
    * [PlayerRole](#playerrole)
    * [Team](#team)
  * [Scalars](#scalars)
    * [Boolean](#boolean)
    * [Float](#float)
    * [ID](#id)
    * [Int](#int)
    * [String](#string)

</details>

## Query
<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong id="query.findall">findAll</strong></td>
<td valign="top">[<a href="#player">Player</a>]</td>
<td>

Retrieve all cricket players in the system

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="query.findplayerbyid">findPlayerById</strong></td>
<td valign="top"><a href="#player">Player</a></td>
<td>

Look up a specific player by their unique identifier

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="query.findplayersbyteam">findPlayersByTeam</strong></td>
<td valign="top">[<a href="#player">Player</a>]</td>
<td>

Find all players belonging to a specific team

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">team</td>
<td valign="top"><a href="#team">Team</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="query.findplayersbyrole">findPlayersByRole</strong></td>
<td valign="top">[<a href="#player">Player</a>]</td>
<td>

Find all players with a specific role (batsman, bowler, etc.)

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">role</td>
<td valign="top"><a href="#playerrole">PlayerRole</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="query.findallmatches">findAllMatches</strong></td>
<td valign="top">[<a href="#match">Match</a>]</td>
<td>

Retrieve all cricket matches in the system

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="query.findmatchbyid">findMatchById</strong></td>
<td valign="top"><a href="#match">Match</a></td>
<td>

Look up a specific match by its unique identifier

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="query.findplayerstats">findPlayerStats</strong></td>
<td valign="top"><a href="#playerstats">PlayerStats</a></td>
<td>

Get detailed statistics for a specific player

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">playerId</td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
</tbody>
</table>

## Mutation
<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong id="mutation.createplayer">createPlayer</strong></td>
<td valign="top"><a href="#player">Player</a></td>
<td>

Create a new cricket player in the system

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">name</td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">team</td>
<td valign="top"><a href="#team">Team</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">role</td>
<td valign="top"><a href="#playerrole">PlayerRole</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">age</td>
<td valign="top"><a href="#int">Int</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">dateOfBirth</td>
<td valign="top"><a href="#string">String</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">country</td>
<td valign="top"><a href="#string">String</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="mutation.updateplayer">updatePlayer</strong></td>
<td valign="top"><a href="#player">Player</a></td>
<td>

Update an existing player's information

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">name</td>
<td valign="top"><a href="#string">String</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">team</td>
<td valign="top"><a href="#team">Team</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">role</td>
<td valign="top"><a href="#playerrole">PlayerRole</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">age</td>
<td valign="top"><a href="#int">Int</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">dateOfBirth</td>
<td valign="top"><a href="#string">String</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">country</td>
<td valign="top"><a href="#string">String</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="mutation.deleteplayer">deletePlayer</strong></td>
<td valign="top"><a href="#boolean">Boolean</a></td>
<td>

Remove a player from the system

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="mutation.creatematch">createMatch</strong></td>
<td valign="top"><a href="#match">Match</a></td>
<td>

Create a new cricket match record

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">opponent</td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">matchDate</td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">venue</td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">result</td>
<td valign="top"><a href="#matchresult">MatchResult</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="mutation.updateplayerstats">updatePlayerStats</strong></td>
<td valign="top"><a href="#playerstats">PlayerStats</a></td>
<td>

Update or create player statistics

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">playerId</td>
<td valign="top"><a href="#id">ID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">matchesPlayed</td>
<td valign="top"><a href="#int">Int</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">runs</td>
<td valign="top"><a href="#int">Int</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">wickets</td>
<td valign="top"><a href="#int">Int</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">average</td>
<td valign="top"><a href="#float">Float</a></td>
<td></td>
</tr>
</tbody>
</table>

## Objects

### Match

Represents a cricket match with opponent details, venue, and result.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong id="match.id">id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

Unique identifier for the match

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="match.opponent">opponent</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

The opposing team in the match

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="match.matchdate">matchDate</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

The date when the match was played

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="match.venue">venue</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

The location where the match was played

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="match.result">result</strong></td>
<td valign="top"><a href="#matchresult">MatchResult</a>!</td>
<td>

The result of the match

</td>
</tr>
</tbody>
</table>

### Player

Represents a cricket player with their basic information, team affiliation, and role.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong id="player.id">id</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

Unique identifier for the player

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="player.name">name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

The name of the player

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="player.team">team</strong></td>
<td valign="top"><a href="#team">Team</a>!</td>
<td>

The team the player belongs to

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="player.role">role</strong></td>
<td valign="top"><a href="#playerrole">PlayerRole</a>!</td>
<td>

The role/position of the player

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="player.age">age</strong></td>
<td valign="top"><a href="#int">Int</a></td>
<td>

The age of the player

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="player.dateofbirth">dateOfBirth</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

The player's date of birth

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="player.country">country</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>

The country the player represents

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="player.stats">stats</strong></td>
<td valign="top"><a href="#playerstats">PlayerStats</a></td>
<td>

Detailed statistics for the player

</td>
</tr>
</tbody>
</table>

### PlayerStats

Contains detailed statistical information about a player's performance.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong id="playerstats.playerid">playerId</strong></td>
<td valign="top"><a href="#id">ID</a>!</td>
<td>

The unique identifier of the player

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="playerstats.matchesplayed">matchesPlayed</strong></td>
<td valign="top"><a href="#int">Int</a></td>
<td>

Number of matches the player has participated in

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="playerstats.runs">runs</strong></td>
<td valign="top"><a href="#int">Int</a></td>
<td>

Total runs scored by the player

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="playerstats.wickets">wickets</strong></td>
<td valign="top"><a href="#int">Int</a></td>
<td>

Total wickets taken by the player

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong id="playerstats.average">average</strong></td>
<td valign="top"><a href="#float">Float</a></td>
<td>

The player's batting or bowling average

</td>
</tr>
</tbody>
</table>

## Enums

### MatchResult

Possible outcomes of a cricket match.

<table>
<thead>
<tr>
<th align="left">Value</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td valign="top"><strong>WON</strong></td>
<td>

Team won the match

</td>
</tr>
<tr>
<td valign="top"><strong>LOST</strong></td>
<td>

Team lost the match

</td>
</tr>
<tr>
<td valign="top"><strong>DRAW</strong></td>
<td>

Match ended in a draw

</td>
</tr>
<tr>
<td valign="top"><strong>NO_RESULT</strong></td>
<td>

Match had no result (rain, etc.)

</td>
</tr>
</tbody>
</table>

### PlayerRole

Different roles a cricket player can have.

<table>
<thead>
<tr>
<th align="left">Value</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td valign="top"><strong>BATSMAN</strong></td>
<td>

Player who specializes in batting

</td>
</tr>
<tr>
<td valign="top"><strong>BOWLER</strong></td>
<td>

Player who specializes in bowling

</td>
</tr>
<tr>
<td valign="top"><strong>ALL_ROUNDER</strong></td>
<td>

Player who can both bat and bowl effectively

</td>
</tr>
<tr>
<td valign="top"><strong>WICKET_KEEPER</strong></td>
<td>

Player who keeps wickets

</td>
</tr>
</tbody>
</table>

### Team

Available cricket teams in the system.

<table>
<thead>
<tr>
<th align="left">Value</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td valign="top"><strong>CSk</strong></td>
<td>

Chennai Super Kings

</td>
</tr>
<tr>
<td valign="top"><strong>MI</strong></td>
<td>

Mumbai Indians

</td>
</tr>
<tr>
<td valign="top"><strong>DC</strong></td>
<td>

Delhi Capitals

</td>
</tr>
<tr>
<td valign="top"><strong>RCB</strong></td>
<td>

Royal Challengers Bangalore

</td>
</tr>
<tr>
<td valign="top"><strong>GT</strong></td>
<td>

Gujarat Titans

</td>
</tr>
</tbody>
</table>

## Scalars

### Boolean

The `Boolean` scalar type represents `true` or `false`.

### Float

The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](https://en.wikipedia.org/wiki/IEEE_floating_point).

### ID

The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"4"`) or integer (such as `4`) input value will be accepted as an ID.

### Int

The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.

### String

The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.


