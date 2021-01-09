import numpy as np
import pandas as pd


countrylanguage = np.genfromtxt('languages.csv',delimiter='|',dtype=str)
fifa = pd.read_csv('data.csv').to_numpy()
# fifa = np.genfromtxt('data.csv',delimiter=",",dtype=str, filling_values="Null")
fifa_attributes = fifa[0]
fifa_attributes_ind = {}
for i, att in enumerate(fifa_attributes):
    fifa_attributes_ind[att] = i
print(fifa_attributes_ind)
countries = {}
for country,language in countrylanguage:
    if country not in countries:
        countries[country] = 1
    else:
        countries[country] += 1

need_fix = []
print("Missing the following countries")
for nation in fifa[:,5]:
    if nation not in countries:
        if nation not in need_fix:
            print(nation)
            need_fix.append(nation)
#print (countries)