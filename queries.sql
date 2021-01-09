-- Queries that explore the data and answer investigative questions

drop table if exists lineup_for_433 cascade;
drop table if exists lineup_for_343 cascade;
drop table if exists comparision_table cascade;
drop view if exists english_speaking cascade;
drop view if exists satisfied_formation cascade;
drop view if exists spanish cascade;
drop view if exists portuguese cascade;
drop view if exists french cascade;
drop view if exists germany cascade;
drop view if exists italian cascade;
drop view if exists english cascade;

-- question 1


-- all english speaking players who have overall ratings >= 75
create view english_speaking as
(select playerGeneralInfo.name, attacker.position, attacker.overallRating, language.country, 'att' as category
from attacker, playerGeneralInfo, language
where attacker.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'English' or language.language2 = 'English' or language.language3 = 'English') and attacker.overallrating>=75
group by attacker.overallRating, playerGeneralInfo.Name, attacker.position, language.country)
union
(select playerGeneralInfo.name, midfielder.position, midfielder.overallRating, language.country, 'mid' as category
from midfielder, playerGeneralInfo, language
where midfielder.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'English' or language.language2 = 'English' or language.language3 = 'English') and midfielder.overallrating>=75
group by midfielder.overallRating, playerGeneralInfo.Name, midfielder.position, language.country)
union
(select playerGeneralInfo.name, defender.position, defender.overallRating, language.country, 'def' as category
from defender, playerGeneralInfo, language
where defender.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'English' or language.language2 = 'English' or language.language3 = 'English') and defender.overallrating>=75
group by defender.overallRating, playerGeneralInfo.Name, defender.position, language.country)
union
(select playerGeneralInfo.name, 'GK' as position, goalkeeper.overallRating, language.country, 'gk' as category
from goalkeeper, playerGeneralInfo, language
where goalkeeper.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'English' or language.language2 = 'English' or language.language3 = 'English') and goalkeeper.overallrating>=75
group by goalkeeper.overallRating, playerGeneralInfo.Name,language.country);

-- formations with three attackers
-- we see that only two formations satisfy this: 433 and 343
create view satisfied_formations as 
select * from formation
where numberofattackers=3;

create table lineup_for_433 (
	name varchar(40),
	overallrating rating
);

create table lineup_for_343 (
	name varchar(40),
	overallrating rating
);

-- lineup for 433 if the FIFA Gamer chooses this formation
insert into lineup_for_433
(select name, overallrating
from english_speaking
where category = 'gk'
order by overallRating DESC limit 1)
union
(select name, overallrating
from english_speaking
where category = 'def'
order by overallRating DESC limit (select numberofdefenders from satisfied_formations where formationname = '433'))
union
(select name, overallrating
from english_speaking
where category = 'mid'
order by overallRating DESC limit (select numberofmidfielders from satisfied_formations where formationname = '433'))
union
(select name, overallrating
from english_speaking
where category = 'att'
order by overallRating DESC limit (select numberofattackers from satisfied_formations where formationname = '433'));

-- lineup for 343 if FIFA Gamer chooses this formation
insert into lineup_for_343
(select name, overallrating
from english_speaking
where category = 'gk'
order by overallRating DESC limit 1)
union
(select name, overallrating
from english_speaking
where category = 'def'
order by overallRating DESC limit (select numberofdefenders from satisfied_formations where formationname = '343'))
union
(select name, overallrating
from english_speaking
where category = 'mid'
order by overallRating DESC limit (select numberofmidfielders from satisfied_formations where formationname = '343'))
union
(select name, overallrating
from english_speaking
where category = 'att'
order by overallRating DESC limit (select numberofattackers from satisfied_formations where formationname = '343'));


-- the question 1's queries lead to a new questions on how competitive each languages' soccer community is, for example, are there many more high rated players who are , French, or Germany?


-- all Spanish speaking players who have overall ratings >= 65
create view spanish as
(select playerGeneralInfo.name, attacker.position, attacker.overallRating, language.country, 'att' as category
from attacker, playerGeneralInfo, language
where attacker.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Spanish' or language.language2 = 'Spanish' or language.language3 = 'Spanish') and attacker.overallrating>=65
group by attacker.overallRating, playerGeneralInfo.Name, attacker.position, language.country)
union
(select playerGeneralInfo.name, midfielder.position, midfielder.overallRating, language.country, 'mid' as category
from midfielder, playerGeneralInfo, language
where midfielder.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Spanish' or language.language2 = 'Spanish' or language.language3 = 'Spanish') and midfielder.overallrating>=65
group by midfielder.overallRating, playerGeneralInfo.Name, midfielder.position, language.country)
union
(select playerGeneralInfo.name, defender.position, defender.overallRating, language.country, 'def' as category
from defender, playerGeneralInfo, language
where defender.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Spanish' or language.language2 = 'Spanish' or language.language3 = 'Spanish') and defender.overallrating>=65
group by defender.overallRating, playerGeneralInfo.Name, defender.position, language.country)
union
(select playerGeneralInfo.name, 'GK' as position, goalkeeper.overallRating, language.country, 'gk' as category
from goalkeeper, playerGeneralInfo, language
where goalkeeper.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Spanish' or language.language2 = 'Spanish' or language.language3 = 'Spanish') and goalkeeper.overallrating>=65
group by goalkeeper.overallRating, playerGeneralInfo.Name,language.country);

-- all Portuguese speaking players who have overall ratings >= 65
create view portuguese as
(select playerGeneralInfo.name, attacker.position, attacker.overallRating, language.country, 'att' as category
from attacker, playerGeneralInfo, language
where attacker.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Portuguese' or language.language2 = 'Portuguese' or language.language3 = 'Portuguese') and attacker.overallrating>=65
group by attacker.overallRating, playerGeneralInfo.Name, attacker.position, language.country)
union
(select playerGeneralInfo.name, midfielder.position, midfielder.overallRating, language.country, 'mid' as category
from midfielder, playerGeneralInfo, language
where midfielder.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Portuguese' or language.language2 = 'Portuguese' or language.language3 = 'Portuguese') and midfielder.overallrating>=65
group by midfielder.overallRating, playerGeneralInfo.Name, midfielder.position, language.country)
union
(select playerGeneralInfo.name, defender.position, defender.overallRating, language.country, 'def' as category
from defender, playerGeneralInfo, language
where defender.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Portuguese' or language.language2 = 'Portuguese' or language.language3 = 'Portuguese') and defender.overallrating>=65
group by defender.overallRating, playerGeneralInfo.Name, defender.position, language.country)
union
(select playerGeneralInfo.name, 'GK' as position, goalkeeper.overallRating, language.country, 'gk' as category
from goalkeeper, playerGeneralInfo, language
where goalkeeper.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Portuguese' or language.language2 = 'Portuguese' or language.language3 = 'Portuguese') and goalkeeper.overallrating>=65
group by goalkeeper.overallRating, playerGeneralInfo.Name,language.country);


-- all english speaking players who have overallratings >= 65
create view english as
(select playerGeneralInfo.name, attacker.position, attacker.overallRating, language.country, 'att' as category
from attacker, playerGeneralInfo, language
where attacker.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'English' or language.language2 = 'English' or language.language3 = 'English') and attacker.overallrating>=65
group by attacker.overallRating, playerGeneralInfo.Name, attacker.position, language.country)
union
(select playerGeneralInfo.name, midfielder.position, midfielder.overallRating, language.country, 'mid' as category
from midfielder, playerGeneralInfo, language
where midfielder.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'English' or language.language2 = 'English' or language.language3 = 'English') and midfielder.overallrating>=65
group by midfielder.overallRating, playerGeneralInfo.Name, midfielder.position, language.country)
union
(select playerGeneralInfo.name, defender.position, defender.overallRating, language.country, 'def' as category
from defender, playerGeneralInfo, language
where defender.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'English' or language.language2 = 'English' or language.language3 = 'English') and defender.overallrating>=65
group by defender.overallRating, playerGeneralInfo.Name, defender.position, language.country)
union
(select playerGeneralInfo.name, 'GK' as position, goalkeeper.overallRating, language.country, 'gk' as category
from goalkeeper, playerGeneralInfo, language
where goalkeeper.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'English' or language.language2 = 'English' or language.language3 = 'English') and goalkeeper.overallrating>=65
group by goalkeeper.overallRating, playerGeneralInfo.Name,language.country);


-- all french speaking players who have overallratings >= 65
create view french as
(select playerGeneralInfo.name, attacker.position, attacker.overallRating, language.country, 'att' as category
from attacker, playerGeneralInfo, language
where attacker.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'French' or language.language2 = 'French' or language.language3 = 'French') and attacker.overallrating>=65
group by attacker.overallRating, playerGeneralInfo.Name, attacker.position, language.country)
union
(select playerGeneralInfo.name, midfielder.position, midfielder.overallRating, language.country, 'mid' as category
from midfielder, playerGeneralInfo, language
where midfielder.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'French' or language.language2 = 'French' or language.language3 = 'French') and midfielder.overallrating>=65
group by midfielder.overallRating, playerGeneralInfo.Name, midfielder.position, language.country)
union
(select playerGeneralInfo.name, defender.position, defender.overallRating, language.country, 'def' as category
from defender, playerGeneralInfo, language
where defender.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'French' or language.language2 = 'French' or language.language3 = 'French') and defender.overallrating>=65
group by defender.overallRating, playerGeneralInfo.Name, defender.position, language.country)
union
(select playerGeneralInfo.name, 'GK' as position, goalkeeper.overallRating, language.country, 'gk' as category
from goalkeeper, playerGeneralInfo, language
where goalkeeper.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'French' or language.language2 = 'French' or language.language3 = 'French') and goalkeeper.overallrating>=65
group by goalkeeper.overallRating, playerGeneralInfo.Name,language.country);


-- all german speaking players who have overallratings >= 65
create view germany as
(select playerGeneralInfo.name, attacker.position, attacker.overallRating, language.country, 'att' as category
from attacker, playerGeneralInfo, language
where attacker.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'German' or language.language2 = 'German' or language.language3 = 'German') and attacker.overallrating>=65
group by attacker.overallRating, playerGeneralInfo.Name, attacker.position, language.country)
union
(select playerGeneralInfo.name, midfielder.position, midfielder.overallRating, language.country, 'mid' as category
from midfielder, playerGeneralInfo, language
where midfielder.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Germany' or language.language2 = 'Germany' or language.language3 = 'German') and midfielder.overallrating>=65
group by midfielder.overallRating, playerGeneralInfo.Name, midfielder.position, language.country)
union
(select playerGeneralInfo.name, defender.position, defender.overallRating, language.country, 'def' as category
from defender, playerGeneralInfo, language
where defender.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'German' or language.language2 = 'German' or language.language3 = 'German') and defender.overallrating>=65
group by defender.overallRating, playerGeneralInfo.Name, defender.position, language.country)
union
(select playerGeneralInfo.name, 'GK' as position, goalkeeper.overallRating, language.country, 'gk' as category
from goalkeeper, playerGeneralInfo, language
where goalkeeper.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'German' or language.language2 = 'German' or language.language3 = 'German') and goalkeeper.overallrating>=65
group by goalkeeper.overallRating, playerGeneralInfo.Name,language.country);

-- all italian speaking players who have overallratings >= 65
create view italian as
(select playerGeneralInfo.name, attacker.position, attacker.overallRating, language.country, 'att' as category
from attacker, playerGeneralInfo, language
where attacker.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Italian' or language.language2 = 'Italian' or language.language3 = 'Italian') and attacker.overallrating>=65
group by attacker.overallRating, playerGeneralInfo.Name, attacker.position, language.country)
union
(select playerGeneralInfo.name, midfielder.position, midfielder.overallRating, language.country, 'mid' as category
from midfielder, playerGeneralInfo, language
where midfielder.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Italian' or language.language2 = 'Italian' or language.language3 = 'Italian') and midfielder.overallrating>=65
group by midfielder.overallRating, playerGeneralInfo.Name, midfielder.position, language.country)
union
(select playerGeneralInfo.name, defender.position, defender.overallRating, language.country, 'def' as category
from defender, playerGeneralInfo, language
where defender.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Italian' or language.language2 = 'Italian' or language.language3 = 'Italian') and defender.overallrating>=65
group by defender.overallRating, playerGeneralInfo.Name, defender.position, language.country)
union
(select playerGeneralInfo.name, 'GK' as position, goalkeeper.overallRating, language.country, 'gk' as category
from goalkeeper, playerGeneralInfo, language
where goalkeeper.playerID=playerGeneralInfo.playerID and playerGeneralInfo.Nationality=language.country and (language.language1 = 'Italian' or language.language2 = 'Italian' or language.language3 = 'Italian') and goalkeeper.overallrating>=65
group by goalkeeper.overallRating, playerGeneralInfo.Name,language.country);

create table comparision_table(
	category varchar(10),
	num_of_players int,
	avg_ratings float
);

-- complete the comparision_table
insert into comparision_table
(select 'English' as category, count(*) as num_of_Players, avg(overallrating) as avg_ratings
from english)
union
(select 'Spanish' as category, count(*) as num_of_Players, avg(overallrating) as avg_ratings
from spanish)
union
(select 'Portuguese' as category, count(*) as num_of_Players, avg(overallrating) as avg_ratings
from portuguese)
union
(select 'French' as category, count(*) as num_of_Players, avg(overallrating) as avg_ratings
from french)
union
(select 'Germany' as category, count(*) as num_of_Players, avg(overallrating) as avg_ratings
from germany)
union
(select 'Italian' as category, count(*) as num_of_Players, avg(overallrating) as avg_ratings
from italian);


-- question 2
drop table if exists lowest_price_performance_ratio_433 cascade;
drop table if exists price_performance_ratio cascade;
drop view if exists non_zero_players cascade;
drop view if exists attackers_value cascade;
drop view if exists midfielders_value cascade;
drop view if exists defenders_value cascade;
drop view if exists goalkeepers_value cascade;
drop view if exists cost_effectiveness_table cascade;

-- some players recorded in this database have value to be zero, we will exclude them in Q2
create view non_zero_players as
select playerid, name, value
from playergeneralinfo
where value != 0;

-- find all the price-performance ratio for attackers with >= 80 ratings
create view attackers_value as
select name, (value/overallrating) as ratio, overallrating
from non_zero_players, attacker
where non_zero_players.playerid = attacker.playerid and attacker.overallrating>=80;

-- find all the price-performance ratio for attackers with >= 80 ratings
create view midfielders_value as
select name, (value/overallrating) as ratio, overallrating
from non_zero_players, midfielder
where non_zero_players.playerid = midfielder.playerid and midfielder.overallrating>=80;

-- find all the price-performance ratio for attackers with >= 80 ratings
create view defenders_value as
select name, (value/overallrating) as ratio, overallrating
from non_zero_players, defender
where non_zero_players.playerid = defender.playerid and defender.overallrating>=80;

-- find all the price-performance ratio for attackers with >= 80 ratings
create view goalkeepers_value as
select name, (value/overallrating) as ratio, overallrating
from non_zero_players, goalkeeper
where non_zero_players.playerid = goalkeeper.playerid and goalkeeper.overallrating>=80;

create table lowest_price_performance_ratio_433(
	name varchar(40),
	overallrating rating
);

-- lineup for 433 with lowest price-performance ratio
insert into lowest_price_performance_ratio_433
((select name, overallrating
from goalkeepers_value
order by ratio limit 1)
union
(select name, overallrating
from defenders_value
order by ratio limit (select numberofdefenders from satisfied_formations where formationname = '433'))
union
(select name, overallrating
from midfielders_value
order by ratio limit (select numberofmidfielders from satisfied_formations where formationname = '433'))
union
(select name, overallrating
from attackers_value
order by ratio limit (select numberofattackers from satisfied_formations where formationname = '433')));

-- the queries lead to a new question to investigate the average cost-effectiveness for 
-- defenders, attackers, midfielders and goalkeepers

create table price_performance_ratio_table(
	category varchar(11),
	avg_price_performance_ratio float
);

-- cost_effectiveness table by positions
insert into price_performance_ratio_table
((select 'attackers' as category, avg(ratio) as avg_price_performance_ratio
from attackers_value)
union
(select 'midfielders' as category, avg(ratio) as avg_price_performance_ratio
from midfielders_value)
union
(select 'defenders' as category, avg(ratio) as avg_price_performance_ratio
from defenders_value)
union
(select 'goalkeepers' as category, avg(ratio) as avg_price_performance_ratio
from goalkeepers_value));



-- question 3
drop table if exists good_communication_clubs cascade;
drop table if exists club_communication_comparison cascade;
drop view if exists BackLineCommunication cascade;
drop view if exists GoodCommunicationClubs cascade;

create table good_communication_clubs(
	club varchar(40)
);

create table club_communication_comparison(
	Good_Comm int,
	All_Clubs int
);

create view BackLineCommunication as 
select GInfo.Club as Club
from language as N1, language as N2, playerGeneralInfo as Ginfo, playerGeneralInfo as Dinfo, Goalkeeper, Defender 
where Ginfo.playerID=Goalkeeper.playerID and Dinfo.playerID=Defender.playerID and 
Ginfo.Club = Dinfo.Club and 
Goalkeeper.overallRating = (select max(overallRating) from Goalkeeper,playerGeneralInfo as G where G.Club=Ginfo.Club and Goalkeeper.playerID=G.playerID) and 
Defender.overallRating in (select overallRating from Defender, playerGeneralInfo as D where D.Club=Dinfo.Club and Defender.playerID=D.playerID order by overallRating DESC limit 4) and
Ginfo.Nationality=N1.country and Dinfo.Nationality=N2.country and
(N1.language1=N2.language1 or N1.language1=N2.language2 or N1.language1=N2.language3 or N1.language2=N2.language1 or N1.language2=N2.language2 or N1.language2=N2.language3 or N1.language3=N2.language1 or N1.language3=N2.language2 or N1.language3=N2.language3) 
order by Goalkeeper.overallRating DESC;

create view GoodCommunicationClubs as 
select Club from BackLineCommunication 
group by Club 
having count(Club)=3;

insert into good_communication_clubs 
SELECT GoodCommunicationClubs.Club FROM GoodCommunicationClubs;

insert into club_communication_comparison 
SELECT count(distinct GoodCommunicationClubs.Club) as Good_Comm, count(distinct playerGeneralInfo.Club) as All_Clubs FROM GoodCommunicationClubs,playerGeneralInfo;

-- need to add the table with good_communication_clubs count and non-good_communications_clubs count for comparision
