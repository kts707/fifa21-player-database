set search_path to soccer;

\copy Language from './tables/languages2.csv' With CSV DELIMITER '|' HEADER;

\copy playerGeneralInfo from './tables/playerInfo.csv' With CSV DELIMITER ',' HEADER;

\copy attacker from './tables/attackers.csv' With CSV DELIMITER ',' HEADER;

\copy midfielder from './tables/midfielders.csv' With CSV DELIMITER ',' HEADER;

\copy defender from './tables/defenders.csv' With CSV DELIMITER ',' HEADER;

\copy goalkeeper from './tables/goalkeepers.csv' With CSV DELIMITER ',' HEADER;

\copy formation from './tables/formation.csv' With CSV DELIMITER ',' HEADER;
