-- Schema on FIFA21 Data

drop schema if exists Soccer cascade;
create schema Soccer;
set search_path to Soccer;

-- Note for all the ratings in this schema: higher ratings --> better/more skillful/stronger

-- General player info (detailed explanations can be found within corresponding table definitions)

create domain rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain age as smallint 
	default null
	check (value>=0 and value <=55);

create domain WeakFoot as smallint 
	default null
	check (value>=1 and value <=5);

create domain SkillMoves as smallint 
	default null
	check (value>=1 and value <=5);

create domain preferredFoot as varchar(5)
	not null
	check (value in ('Left', 'Right'));

-- GoalKeeper skill ratings (detailed explanations can be found within table definitions)

create domain GKdiving as float
	default null
	check (value>=0 and value <=100);

create domain GKhandling as float
	default null
	check (value>=0 and value <=100);

create domain GKkicking as float 
	default null
	check (value>=0 and value <=100);

create domain GKpositioning as float 
	default null
	check (value>=0 and value <=100);

create domain GKreflexes as float 
	default null
	check (value>=0 and value <=100);

-- Non-goalkeeper skill ratings (detailed explanations can be found within corresponding table definitions)

create domain Crossing as float
	default null
	check (value>=0 and value <=100);

create domain Finishing as float
	default null
	check (value>=0 and value <=100);

create domain HeadingAccuracy as float 
	default null
	check (value>=0 and value <=100);

create domain ShortPassing as float 
	default null
	check (value>=0 and value <=100);

create domain Volleys as float
	default null
	check (value>=0 and value <=100);

create domain Dribbling as float
	default null
	check (value>=0 and value <=100);

create domain Curve as float
	default null
	check (value>=0 and value <=100);

create domain FKAccuracy as float
	default null
	check (value>=0 and value <=100);

create domain LongPassing as float 
	default null
	check (value>=0 and value <=100);

create domain BallControl as float 
	default null
	check (value>=0 and value <=100);

create domain Acceleration as float 
	default null
	check (value>=0 and value <=100);

create domain Speed as float
	default null
	check (value>=0 and value <=100);

create domain Agility as float 
	default null
	check (value>=0 and value <=100);

create domain Reactions as float 
	default null
	check (value>=0 and value <=100);

create domain Balance as float
	default null
	check (value>=0 and value <=100);

create domain ShotPower as float 
	default null
	check (value>=0 and value <=100);

create domain Jumping as float 
	default null
	check (value>=0 and value <=100);

create domain Stamina as float 
	default null
	check (value>=0 and value <=100);

create domain Strength as float 
	default null
	check (value>=0 and value <=100);

create domain LongShots as float 
	default null
	check (value>=0 and value <=100);

create domain Aggression as float 
	default null
	check (value>=0 and value <=100);

create domain Interception as float
	default null
	check (value>=0 and value <=100);

create domain Positioning as float
	default null
	check (value>=0 and value <=100);

create domain Vision as float
	default null
	check (value>=0 and value <=100);

create domain Penalties as float
	default null
	check (value>=0 and value <=100);

create domain StandingTackle as float
	default null
	check (value>=0 and value <=100);

create domain SlidingTackle as float
	default null
	check (value>=0 and value <=100);

create domain Composure as float
	default null
	check (value>=0 and value <=100);

create domain DefensiveAwareness as float 
	default null
	check (value>=0 and value <=100);


-- Positional Ratings (detailed explanations can be found within corresponding table definitions)

-- For Attackers

create domain LS_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain ST_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RS_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain LW_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain LF_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain CF_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RF_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RW_rating as smallint 
	default null
	check (value>=0 and value <=100);

-- for Midfielders (detailed explanations can be found within corresponding table definitions)

create domain LAM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain CAM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RAM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain LM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain LCM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain CM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RCM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain LDM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain CDM_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RDM_rating as smallint 
	default null
	check (value>=0 and value <=100);

-- for Defenders (detailed explanations can be found within corresponding table definitions)

create domain LWB_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RWB_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain LB_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain LCB_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain CB_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RCB_rating as smallint 
	default null
	check (value>=0 and value <=100);

create domain RB_rating as smallint 
	default null
	check (value>=0 and value <=100);



-- Tables Definitions

-- table containing country and the official languages spoken in that country
-- each row's language1 must not be null, meaning that each country in this table has at 
-- least one official language, and each country can have up to 3 official languages such
-- that all the countries in our dataset can be fit into the table
create table Language(
	-- name of the country
	country varchar(60) primary key,
	-- first official language
	language1 varchar(60) not null,
	-- possibly second official language
	language2 varchar(60), 
	-- possibly third official language
	language3 varchar(60),
	check (language1 != language2 AND language1 != language3 AND language2 != language3));


-- a player that is in the database with the player's general information
create table playerGeneralInfo(
	-- player's unique ID
	playerID integer primary key,
	-- player's name
	Name varchar(40) not null,
	-- player's age
	Age age,
	-- player's nationality
	Nationality varchar(60) not null,
	-- the name of the club that the player is playing for
	Club varchar(40),
	-- the player's value in the game(FIFA21)
	Value integer,
	-- the player's wage in the game(FIFA21)
	Wage integer,
	-- the player's preferred foot in soccer
	preferredFoot preferredFoot,
	foreign key (nationality) references Language(country));


-- table containing all possible formations of lineup in real-world soccer matches
create table Formation(
	-- the name of the formation
	FormationName varchar(3) primary key,
	-- the number of defenders needed in this particular formation
	NumberofDefenders integer not null,
	-- the number of midfielders needed in this particular formation
	NumberofMidfielders integer not null,
	-- the number of attackers needed in this particular formation
	NumberofAttackers integer not null);


-- table containing all goalkeepers info with specific skill ratings for goalkeepers
-- each row has the information on one particular goalkeeper in the data
create table GoalKeeper(
	-- player's unique ID
	playerID integer primary key,
	-- the player's in-game rating when playing as a goalkeeper
	overallRating rating,
	-- the player's physical height in real world in cm
	Height integer,
	-- the player's physical weight in real world in kg
	Weight integer,
	-- the player's in-game rating on the ability in diving
	GKdiving GKdiving,
	-- the player's in-game rating on the ability in handling the ball
	GKhandling GKhandling,
	-- the player's in-game rating on the ability in kicking the ball
	GKkicking GKkicking,
	-- the player's in-game rating on the ability in positioning
	GKpositioning GKpositioning,
	-- the player's in-game rating on the ability in reflexes
	GKreflexes GKreflexes,
	foreign key (playerID) references playerGeneralInfo(playerID));


-- table containing all defenders info with specific positional ratings for defenders 
-- specifically
-- each row has the information on one particular defender in the data
create table Defender(
	-- player's unique ID
	playerID integer primary key,
	-- the player's in-game rating when playing in the most confortable position
	-- i.e. the highest rating among all the defender's positions
	overallRating rating,
	-- the player's position where his rating is the highest among all defender's
	-- positions
	Position varchar(3),
	-- player's physical height in real world in cm
	Height integer,
	-- player's physical weight in real world in kg
	Weight integer,
	-- player's in-game rating when playing as LWB
	LWB LWB_rating,
	-- player's in-game rating when playing as RWB
	RWB RWB_rating,
	-- player's in-game rating when playing as LB
	LB LB_rating,
	-- player's in-game rating when playing as LCB
	LCB LCB_rating,
	-- player's in-game rating when playing as CB
	CB CB_rating,
	-- player's in-game rating when playing as RCB
	RCB RCB_rating,
	-- player's in-game rating when playing as RB
	RB RB_rating,
	-- the player's in-game rating on how skillful in terms of crossing
	Crossing Crossing,
	-- the player's in-game rating on how skillful in terms of finishing 
	Finishing Finishing,
	-- the player's in-game rating on how skillful in terms of heading
	HeadingAccuracy HeadingAccuracy,
	-- the player's in-game rating on how skillful in terms of short passing
	ShortPassing ShortPassing,
	-- the player's in-game rating on how skillful in terms of volleys
	Volleys Volleys,
	-- the player's in-game rating on how skillful in terms of dribbling
	Dribbling Dribbling,
	-- the player's in-game rating on how skillful in terms of curving the ball
	Curve Curve,
	-- the player's in-game rating on how skillful in terms of FK accuracy
	FKAccuray FKAccuracy,
	-- the player's in-game rating on how skillful in terms of long passing
	LongPassing LongPassing,
	-- the player's in-game rating on how skillful in terms of ball control
	BallControl BallControl,
	-- the player's in-game rating on player's sprint acceleration
	Acceleration Acceleration,
	-- the player's in-game rating on player's sprint speed
	Speed Speed,
	-- the player's in-game rating on how ability in terms of agility
	Agility Agility,
	-- the player's in-game rating on player's reactions
	Reactions Reactions,
	-- the player's in-game rating on player's balance
	Balance Balance,
	-- the player's in-game rating on player's shooting power
	ShotPower ShotPower,
	-- the player's in-game rating on player's jumping
	Jumping Jumping,
	-- the player's in-game rating on player's stamina
	Stamina Stamina,
	-- the player's in-game rating on player's physical strength
	Strength Strength,
	-- the player's in-game rating on how skillful in terms of long shots
	LongShots LongShots,
	-- the player's in-game rating on player's aggression
	Aggression Aggression,
	-- the player's in-game rating on how skillful in terms of interception
	Interception Interception,
	-- the player's in-game rating on how skillful in terms of positioning
	Positioning Positioning,
	-- the player's in-game rating on player's vision
	Vision Vision,
	-- the player's in-game rating on how skillful in terms of shooting penalties
	Penalties Penalties,
	-- the player's in-game rating on player's composure
	Composure Composure,
	-- the player's in-game rating on player's defensive awareness
	DefensiveAwareness DefensiveAwareness,
	-- the player's in-game rating on how skillful in terms of standing tackle
	StandingTackle StandingTackle,
	-- the player's in-game rating on how skillful in terms of sliding tackle
	SlidingTackle SlidingTackle,
	-- how strong the player's weak foot is
	WeakFoot WeakFoot,
	-- how skillfull the player is when he is dribbling
	SkillMoves SkillMoves,
	-- how much the player likes offensive strategies
	attackRate varchar(6),
	-- how much the player likes defensive strategies
	defendRate varchar(6),
	foreign key (playerID) references playerGeneralInfo(playerID));


-- table containing all midfielders info with specific positional ratings for midfielders 
-- specifically
-- each row has the information on one particular midfielder in the data

create table Midfielder(
	-- player's unique ID
	playerID integer primary key,
	-- the player's in-game rating when playing in the most confortable position
	-- i.e. the player's highest rating among all the midfielder's positions
	overallRating rating,
	-- the player's position where his rating is the highest among all midfielder's
	-- positions
	Position varchar(3),
	-- player's physical height in real world in cm
	Height integer,
	-- player's physical weight in real world in kg
	Weight integer,
	-- player's in-game rating when playing as LAM
	LAM LAM_rating,
	-- player's in-game rating when playing as CAM
	CAM CAM_rating,
	-- player's in-game rating when playing as RAM
	RAM RAM_rating,
	-- player's in-game rating when playing as LM
	LM LM_rating,
	-- player's in-game rating when playing as LCM
	LCM LCM_rating,
	-- player's in-game rating when playing as LCM
	CM CM_rating,
	-- player's in-game rating when playing as CM
	RCM RCM_rating,
	-- player's in-game rating when playing as RM
	RM RM_rating,
	-- player's in-game rating when playing as LDM
	LDM LDM_rating,
	-- player's in-game rating when playing as CDM
	CDM CDM_rating,
	-- player's in-game rating when playing as RDM
	RDM RDM_rating,
	-- the player's in-game rating on how skillful in terms of crossing
	Crossing Crossing,
	-- the player's in-game rating on how skillful in terms of finishing 
	Finishing Finishing,
	-- the player's in-game rating on how skillful in terms of heading
	HeadingAccuracy HeadingAccuracy,
	-- the player's in-game rating on how skillful in terms of short passing
	ShortPassing ShortPassing,
	-- the player's in-game rating on how skillful in terms of volleys
	Volleys Volleys,
	-- the player's in-game rating on how skillful in terms of dribbling
	Dribbling Dribbling,
	-- the player's in-game rating on how skillful in terms of curving the ball
	Curve Curve,
	-- the player's in-game rating on how skillful in terms of FK accuracy
	FKAccuray FKAccuracy,
	-- the player's in-game rating on how skillful in terms of long passing
	LongPassing LongPassing,
	-- the player's in-game rating on how skillful in terms of ball control
	BallControl BallControl,
	-- the player's in-game rating on player's sprint acceleration
	Acceleration Acceleration,
	-- the player's in-game rating on player's sprint speed
	Speed Speed,
	-- the player's in-game rating on how ability in terms of agility
	Agility Agility,
	-- the player's in-game rating on player's reactions
	Reactions Reactions,
	-- the player's in-game rating on player's balance
	Balance Balance,
	-- the player's in-game rating on player's shooting power
	ShotPower ShotPower,
	-- the player's in-game rating on player's jumping
	Jumping Jumping,
	-- the player's in-game rating on player's stamina
	Stamina Stamina,
	-- the player's in-game rating on player's physical strength
	Strength Strength,
	-- the player's in-game rating on how skillful in terms of long shots
	LongShots LongShots,
	-- the player's in-game rating on player's aggression
	Aggression Aggression,
	-- the player's in-game rating on how skillful in terms of interception
	Interception Interception,
	-- the player's in-game rating on how skillful in terms of positioning
	Positioning Positioning,
	-- the player's in-game rating on player's vision
	Vision Vision,
	-- the player's in-game rating on how skillful in terms of shooting penalties
	Penalties Penalties,
	-- the player's in-game rating on player's composure
	Composure Composure,
	-- the player's in-game rating on player's defensive awareness
	DefensiveAwareness DefensiveAwareness,
	-- the player's in-game rating on how skillful in terms of standing tackle
	StandingTackle StandingTackle,
	-- the player's in-game rating on how skillful in terms of sliding tackle
	SlidingTackle SlidingTackle,
	-- how weak the player's weak foot is
	WeakFoot WeakFoot,
	-- how skillfull the player is when he is dribbling
	SkillMoves SkillMoves,
	-- how much the player likes offensive strategies
	attackRate varchar(6),
	-- how much the player likes defensive strategies
	defendRate varchar(6),
	foreign key (playerID) references playerGeneralInfo(playerID));



-- table containing all attackers info with specific positional ratings for attackers
-- specifically
-- each row has the information on one particular attacker in the data

create table Attacker(
	-- player's unique ID
	playerID integer primary key,
	-- the player's in-game rating when playing in the most confortable position
	-- i.e. the highest rating among all the attacker's positions
	overallRating rating,
	-- the player's position where his rating is the highest among all defender's
	-- positions
	Position varchar(3),
	-- player's physical height in real world in cm
	Height integer,
	-- player's physical weight in real world in kg
	Weight integer,
	-- player's in-game rating when playing as LS
	LS LS_rating,
	-- player's in-game rating when playing as ST
	ST ST_rating,
	-- player's in-game rating when playing as RS
	RS RS_rating,
	-- player's in-game rating when playing as LW
	LW LW_rating,
	-- player's in-game rating when playing as LF
	LF LF_rating,
	-- player's in-game rating when playing as CF
	CF CF_rating,
	-- player's in-game rating when playing as RF
	RF RF_rating,
	-- player's in-game rating when playing as RW
	RW RW_rating,
	-- the player's in-game rating on how skillful in terms of crossing
	Crossing Crossing,
	-- the player's in-game rating on how skillful in terms of finishing 
	Finishing Finishing,
	-- the player's in-game rating on how skillful in terms of heading
	HeadingAccuracy HeadingAccuracy,
	-- the player's in-game rating on how skillful in terms of short passing
	ShortPassing ShortPassing,
	-- the player's in-game rating on how skillful in terms of volleys
	Volleys Volleys,
	-- the player's in-game rating on how skillful in terms of dribbling
	Dribbling Dribbling,
	-- the player's in-game rating on how skillful in terms of curving the ball
	Curve Curve,
	-- the player's in-game rating on how skillful in terms of FK accuracy
	FKAccuray FKAccuracy,
	-- the player's in-game rating on how skillful in terms of long passing
	LongPassing LongPassing,
	-- the player's in-game rating on how skillful in terms of ball control
	BallControl BallControl,
	-- the player's in-game rating on player's sprint acceleration
	Acceleration Acceleration,
	-- the player's in-game rating on player's sprint speed
	Speed Speed,
	-- the player's in-game rating on how ability in terms of agility
	Agility Agility,
	-- the player's in-game rating on player's reactions
	Reactions Reactions,
	-- the player's in-game rating on player's balance
	Balance Balance,
	-- the player's in-game rating on player's shooting power
	ShotPower ShotPower,
	-- the player's in-game rating on player's jumping
	Jumping Jumping,
	-- the player's in-game rating on player's stamina
	Stamina Stamina,
	-- the player's in-game rating on player's physical strength
	Strength Strength,
	-- the player's in-game rating on how skillful in terms of long shots
	LongShots LongShots,
	-- the player's in-game rating on player's aggression
	Aggression Aggression,
	-- the player's in-game rating on how skillful in terms of interception
	Interception Interception,
	-- the player's in-game rating on how skillful in terms of positioning
	Positioning Positioning,
	-- the player's in-game rating on player's vision
	Vision Vision,
	-- the player's in-game rating on how skillful in terms of shooting penalties
	Penalties Penalties,
	-- the player's in-game rating on player's composure
	Composure Composure,
	-- the player's in-game rating on player's defensive awareness
	DefensiveAwareness DefensiveAwareness,
	-- the player's in-game rating on how skillful in terms of standing tackle
	StandingTackle StandingTackle,
	-- the player's in-game rating on how skillful in terms of sliding tackle
	SlidingTackle SlidingTackle,
	-- how strong the player's weak foot is
	WeakFoot WeakFoot,
	-- how skillfull the player is when he is dribbling
	SkillMoves SkillMoves,
	-- how much the player likes offensive strategies
	attackRate varchar(6),
	-- how much the player likes defensive strategies
	defendRate varchar(6),
	foreign key (playerID) references playerGeneralInfo(playerID));
