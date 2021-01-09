# -*- coding: utf-8 -*-

import pandas as pd
path_to_raw_data = '/content/data.csv'
raw_data = pd.read_csv(path_to_raw_data)

data = raw_data.drop(['Unnamed: 0', 'Photo','Flag','Potential','Club Logo','International Reputation','Body Type',
                      'Real Face','Release Clause','Jersey Number','Joined','Contract Valid Until','Special','Likes','Dislikes',
                      'Following'], axis=1).copy()

# Clean up positional ratings
to_correct_positional_ratings = ['LS', 'ST', 'RS', 'LW', 'LF', 'CF', 'RF', 'RW', 'LAM', 'CAM', 'RAM',
       'LM', 'LCM', 'CM', 'RCM', 'RM', 'LWB', 'LDM', 'CDM', 'RDM', 'RWB', 'LB',
       'LCB', 'CB', 'RCB', 'RB', 'GK']
for attr in to_correct_positional_ratings:
  for idx in range(len(data[attr])):
    if str(data[attr][idx]) == 'nan':
      continue
    else:
      try:
        data[attr][idx] = int(data[attr][idx][:2])
      except:
        data[attr][idx] = int(data[attr][idx][:1])

# Clean Skill Ratings
to_int = ['Crossing', 'Finishing',
       'Heading Accuracy', 'Short Passing', 'Volleys', 'Dribbling', 'Curve',
       'FK Accuracy', 'Long Passing', 'Ball Control', 'Acceleration',
       'Sprint Speed', 'Agility', 'Reactions', 'Balance', 'Shot Power',
       'Jumping', 'Stamina', 'Strength', 'Long Shots', 'Aggression',
       'Interceptions', 'Positioning', 'Vision', 'Penalties', 'Composure',
       'Defensive Awareness', 'Standing Tackle', 'Sliding Tackle', 'GK Diving',
       'GK Handling', 'GK Kicking', 'GK Positioning', 'GK Reflexes']
for attr in to_int:
  for idx in range(len(data[attr])):
    if str(data[attr][idx]) == 'nan':
      continue
    else:
      data[attr][idx] = int(data[attr][idx])

# Cleanup the column names and data types

data['WeakFoot'] = data['Weak Foot'].str.slice(0,1).astype('int64')
data['Height'] = ((data['Height'].str.slice(0,1).astype('float32') * 12 + data['Height'].str.slice(2,3).astype('float32'))*2.54).astype('int64')
data['Weight'] = (data['Weight'].str.slice(0,3).astype('float32') * 0.45359237).astype('int64')
data['SkillMoves'] = data['Skill Moves'].str.slice(0,1).astype('int64')

# work rate in offense and defense
attackRate, defendRate = [], []
for i in range(len(data['Work Rate'])):
  if (data['Work Rate'][i] == 'N/A/N/A'):
    attackRate.append('Medium')
    defendRate.append('Medium')
  else:
    attackRate.append(data['Work Rate'][i].split('/')[0])
    defendRate.append(data['Work Rate'][i].split('/')[1][1:])

data['attackRate'] = pd.Series(attackRate)
data['defendRate'] = pd.Series(defendRate)

# Drop unnecessary columns
data.drop(['Weak Foot'],axis=1,inplace=True)
data.drop(['Work Rate'],axis=1,inplace=True)
data.drop(['Skill Moves'],axis=1,inplace=True)

# Rename Columns
data.rename(columns={'Overall': 'overallrating','ID':'playerID','Preferred Foot':'preferredFoot','GK Diving':'GKdiving','GK Handling':'GKhandling',
'GK Kicking': 'GKkicking','GK Positioning':'GKpositioning','GK Reflexes':'GKreflexes','Heading Accuracy':'HeadingAccuracy','Short Passing':'ShortPassing',
'FK Accuracy':'FKAccuracy','Long Passing':'LongPassing','Ball Control':'BallControl','Shot Power':'ShotPower','Long Shots':'LongShots','Standing Tackle':'StandingTackle',
'Sliding Tackle':'SlidingTackle','Sprint Speed':'Speed','Defensive Awareness':'DefensiveAwareness'},inplace=True)

# Separate into 4 Tables
attacker_positions = ['LS','ST','RS','LW','LF','CF','RF','RW']
midfielder_positions = ['LAM', 'CAM', 'RAM','LM', 'LCM', 'CM', 'RCM', 'RM', 'LDM', 'CDM', 'RDM']
defender_positions = ['RWB', 'LB','LCB', 'CB', 'RCB', 'RB','LWB']

PlayerInfo = data[['playerID','Name','Age','Nationality','Club','Value','Wage','preferredFoot']].copy()
GoalKeepers = data.loc[data['Position'] == 'GK'].drop(['Position'],axis=1)
Attackers = data.loc[data['Position'].isin(attacker_positions)]
Midfielders = data.loc[data['Position'].isin(midfielder_positions)]
Defenders = data.loc[data['Position'].isin(defender_positions)]

# Drop the irelevant columns for each table
GoalKeepers = GoalKeepers[['playerID','overallrating','Height','Weight','GKdiving','GKhandling','GKkicking','GKpositioning','GKreflexes']]
Attackers = Attackers.drop(['Name','Age','Nationality','Club','Value','Wage','preferredFoot','GKdiving','GKhandling','GKkicking','GKpositioning','GKreflexes'],axis=1)
Midfielders = Midfielders.drop(['Name','Age','Nationality','Club','Value','Wage','preferredFoot','GKdiving','GKhandling','GKkicking','GKpositioning','GKreflexes'],axis=1)
Defenders = Defenders.drop(['Name','Age','Nationality','Club','Value','Wage','preferredFoot','GKdiving','GKhandling','GKkicking','GKpositioning','GKreflexes'],axis=1)

non_attacker_positions = midfielder_positions+defender_positions+['GK']
non_midfielder_positions = attacker_positions+defender_positions+['GK']
non_defender_positions = attacker_positions+midfielder_positions+['GK']

for val in non_attacker_positions:
  Attackers = Attackers.drop([val],axis=1)
for val in non_midfielder_positions:
  Midfielders = Midfielders.drop([val],axis=1)
for val in non_defender_positions:
  Defenders = Defenders.drop([val],axis=1)

# Save the tables as .csv files
PlayerInfo.to_csv('playerInfo.csv',index=False)
Defenders.to_csv('defenders.csv',index=False)
Midfielders.to_csv('midfielders.csv',index=False)
Attackers.to_csv('attackers.csv',index=False)

